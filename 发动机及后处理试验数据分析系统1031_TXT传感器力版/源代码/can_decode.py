"""ASC + user supplied DBC -> sparse physical CSV and traceable audit files.

No hold, interpolation or cross-channel/source merging is performed during export.
"""
import csv
import io
import hashlib
import json
import math
import re
import statistics
from collections import Counter, defaultdict
from dataclasses import dataclass, field
from pathlib import Path


# Name, DBC message, DBC signal, display unit, review note.
TARGETS = [
    ("车速", "CCVS1", "WheelBasedVehicleSpeed", "km/h", "CCVS1，按 PGN 匹配源地址"),
    ("大气压力", "AMB", "BarometricPress", "kPa", "信息表 EEC1 不包含此量；DBC 实为 AMB/0xFEF5"),
    ("发动机转速", "EEC1", "EngSpeed", "rpm", ""),
    ("发动机实际扭矩百分比", "EEC1", "ActualEngPercentTorque", "%", "相对参考扭矩；不可直接当作 Nm"),
    ("实际最大可利用发动机扭矩百分比", "EEC2", "ActlMaxAvailableEngPercentTorque", "%", "信息表为 EEC1；DBC 实为 EEC2/0xF003"),
    ("油门踏板开度", "EEC2", "AccelPedalPos1", "%", ""),
    ("发动机机油油位", "EFL_P1", "EngOilLevel", "%", ""),
    ("发动机冷却液液位", "EFL_P1", "EngCoolantLevel", "%", ""),
    ("发动机燃油输出压力", "EFL_P1", "EngFuelDeliveryPress", "kPa", ""),
    ("发动机机油压力", "EFL_P1", "EngOilPress", "kPa", ""),
    ("大气温度", "AMB", "AmbientAirTemp", "deg C", "信息表 ET1 不包含此量；DBC 实为 AMB/0xFEF5"),
    ("发动机冷却液温度", "ET1", "EngCoolantTemp", "deg C", ""),
    ("发动机燃油温度1", "ET1", "EngFuelTemp1", "deg C", "按工作安排将 -40 标为传感器无效"),
    ("发动机机油温度", "ET1", "EngOilTemp1", "deg C", ""),
    ("发动机累积工作时间", "HOURS", "EngTotalHoursOfOperation", "h", "ECU 累计计数"),
    ("发动机总转数", "HOURS", "EngTotalRevolutions", "r", "ECU 累计计数"),
    ("发动机燃油消耗率", "LFE", "EngFuelRate", "L/h", ""),
    ("发动机行程燃油", "LFC", "EngTripFuel", "L", "信息表为 LFE；DBC 实为 LFC/0xFEE9"),
    ("发动机累计燃油消耗量", "COMPUTED", "IntegratedFuel_L", "L", "按本次记录有效燃油率梯形积分；不是 ECU 生命周期总油耗"),
    ("发动机输入电压", "VEP1", "BatteryPotential_PowerInput1", "V", ""),
    ("点火开关电压", "VEP1", "KeyswitchBatteryPotential", "V", ""),
    ("电源电压采样", "VEP1", "ChargingSystemPotential", "V", "DBC 定义为充电系统输出电压；与原表称呼有差异"),
]


def read_text(path):
    data = Path(path).read_bytes()
    for encoding in ("utf-8-sig", "gb18030", "cp1252"):
        try:
            return data.decode(encoding)
        except UnicodeDecodeError:
            pass
    raise ValueError(f"无法识别文件编码：{path}")


def pgn(frame_id):
    result = (frame_id >> 8) & 0x3FFFF
    return result & 0x3FF00 if ((frame_id >> 16) & 0xFF) < 240 else result


@dataclass
class SignalSpec:
    name: str
    start: int
    size: int
    endian: int
    signed: bool
    factor: float
    offset: float
    minimum: float
    maximum: float
    unit: str
    mux: str = ""


@dataclass
class Message:
    frame_id: int
    extended: bool
    name: str
    size: int
    dbc: str
    signals: dict = field(default_factory=dict)


def load_dbcs(paths):
    messages = []
    bo = re.compile(r"^BO_\s+(\d+)\s+(\S+)\s*:\s*(\d+)")
    sg = re.compile(r'^\s*SG_\s+(\w+)\s*(M|m\d+M?)?\s*:\s*(\d+)\|(\d+)@([01])([+-])\s*\(([^,]+),([^\)]+)\)\s*\[([^|]+)\|([^\]]+)\]\s*"([^"]*)"')
    for path in paths:
        current = None
        for line in read_text(path).splitlines():
            match = bo.match(line)
            if match:
                ident, name, size = match.groups()
                ident = int(ident)
                current = Message(ident & 0x1FFFFFFF, bool(ident & 0x80000000), name, int(size), str(path))
                messages.append(current)
            else:
                match = sg.match(line)
                if match and current:
                    name, mux, start, size, endian, sign, factor, offset, low, high, unit = match.groups()
                    current.signals[name] = SignalSpec(name, int(start), int(size), int(endian), sign == "-", float(factor), float(offset), float(low), float(high), unit, mux or "")
    if not messages:
        raise ValueError("DBC 中没有可读报文定义")
    return messages


def extract_raw(payload, signal):
    if signal.endian == 1:
        if signal.start + signal.size > len(payload) * 8:
            raise ValueError("short_payload")
        value = (int.from_bytes(payload, "little") >> signal.start) & ((1 << signal.size) - 1)
    else:
        bit = signal.start
        value = 0
        for _ in range(signal.size):
            if bit < 0 or bit >= len(payload) * 8:
                raise ValueError("short_payload")
            value = (value << 1) | ((payload[bit // 8] >> (bit % 8)) & 1)
            bit = bit + 15 if bit % 8 == 0 else bit - 1
    return value


def physical_value(payload, signal, j1939=False):
    raw = extract_raw(payload, signal)
    if signal.mux:
        raise ValueError("目标信号含多路复用，需显式配置后解析：" + signal.name)
    # Reserved encodings apply only to selected numeric J1939 parameters, never Sensor ADC.
    if j1939 and signal.size >= 8:
        high = raw >> (signal.size - 8)
        if high == 255:
            return raw, None, "not_available"
        if high == 254:
            return raw, None, "error_code"
    signed_raw = raw - (1 << signal.size) if signal.signed and raw & (1 << (signal.size - 1)) else raw
    value = signed_raw * signal.factor + signal.offset
    if signal.maximum > signal.minimum and not signal.minimum - 1e-7 <= value <= signal.maximum + 1e-7:
        return raw, None, "out_of_range"
    if signal.name == "EngFuelTemp1" and abs(value + 40) < 1e-7:
        return raw, None, "sensor_invalid_minus40"
    return raw, value, "valid"


def write_csv(path, header, rows):
    with Path(path).open("w", encoding="utf-8-sig", newline="") as stream:
        writer = csv.writer(stream)
        writer.writerow(header)
        writer.writerows(rows)


def input_lines(path, counts):
    text = read_text(path)
    first = text.splitlines()[0] if text else ''
    required = {'时间标识', 'CAN通道', 'ID号', '帧类型', '帧格式', 'CAN类型', '长度', '数据'}
    header = next(csv.reader([first]), [])
    if not required.issubset(set(header)):
        yield from enumerate(text.splitlines(), 1)
        return
    counts['table_header'] = 1
    reader = csv.DictReader(io.StringIO(text))
    for row in reader:
        counts['table_rows'] += 1
        if row.get('帧类型', '').strip() != '数据帧' or row.get('CAN类型', '').strip().upper() != 'CAN':
            counts['unsupported_or_remote'] += 1
            continue
        try:
            time = float(row['时间标识'])
            match = re.fullmatch(r'(?:ch|can)?\s*(\d+)', row['CAN通道'].strip(), re.I)
            if not match or not math.isfinite(time) or time < 0:
                raise ValueError('invalid time/channel')
            channel = int(match.group(1))
            ident_text = row['ID号'].strip()
            if not re.fullmatch(r'0[xX][0-9a-fA-F]{1,8}', ident_text):
                raise ValueError('invalid ID')
            ident = int(ident_text, 16)
            frame_format = row['帧格式'].strip()
            if frame_format not in ('标准帧', '扩展帧'):
                raise ValueError('invalid format')
            extended = frame_format == '扩展帧'
            if ident > (0x1FFFFFFF if extended else 0x7FF):
                raise ValueError('ID exceeds format')
            dlc = int(row['长度'])
            payload = row['数据'].strip()
            if not payload.lower().startswith('x|'):
                raise ValueError('expected hex payload')
            tokens = payload[2:].split()
            if not 0 <= dlc <= 8 or len(tokens) != dlc or any(not re.fullmatch(r'[0-9a-fA-F]{2}', token) for token in tokens):
                raise ValueError('invalid DLC/payload')
            yield reader.line_num, f"{time:.9f} {channel} {ident:X}{'x' if extended else ''} Rx d {dlc} " + ' '.join(tokens)
        except (ValueError, KeyError, TypeError):
            counts['malformed'] += 1


def decode_asc(asc_path, dbc_paths, output_dir, channel=None, source=None):
    asc_path, output_dir = Path(asc_path), Path(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)
    messages = load_dbcs(dbc_paths)
    selection = {}
    mapping = []
    for label, message_name, signal_name, unit, note in TARGETS:
        found = [m for m in messages if m.name in (("CCVS1", "CCVS") if message_name == "CCVS1" else (message_name,)) and signal_name in m.signals]
        # Some J1939 DBs repeat a PGN for different addresses; select one identical definition.
        if len(found) > 1:
            definitions = {(tuple(vars(m.signals[signal_name]).values()), m.extended, m.size, pgn(m.frame_id)) for m in found}
            if len(definitions) > 1:
                raise ValueError("DBC 目标定义有歧义：" + signal_name)
        m = found[0] if found else None
        mapping.append([label, signal_name, unit, m.name if m else message_name, f"0x{pgn(m.frame_id):04X}" if m else "", note, bool(m) or message_name == "COMPUTED"])
        if m:
            key = (m.extended, pgn(m.frame_id) if m.extended else m.frame_id)
            selection.setdefault(key, {})[signal_name] = (m, m.signals[signal_name], unit)
    # SensorCAN contains raw ADC values only; do not invent force/voltage calibration.
    for m in messages:
        if m.name == "Sensor":
            key = (m.extended, pgn(m.frame_id) if m.extended else m.frame_id)
            for s in m.signals.values():
                selection.setdefault(key, {})[s.name] = (m, s, s.unit or "raw ADC")
                mapping.append([s.name, s.name, s.unit or "raw ADC", m.name, f"0x{m.frame_id:X}", "DBC 未提供工程标定，保留原始 ADC", True])

    # Engineering force is accepted only when explicitly defined by the supplied DBC.
    force_definitions = [(m, spec) for m in messages for spec in m.signals.values() if spec.name == 'IN1_Force_kN']
    if len(force_definitions) > 1:
        definitions = {(m.frame_id, m.extended, tuple(vars(spec).values())) for m, spec in force_definitions}
        if len(definitions) > 1:
            raise ValueError('IN1 力信号存在冲突 DBC 定义')
    if force_definitions:
        m, spec = force_definitions[0]
        if m.extended or spec.unit != 'kN':
            raise ValueError('IN1 力信号需要标准帧及 kN 单位')
        selection.setdefault((False, m.frame_id), {})[spec.name] = (m, spec, spec.unit)
        mapping.append(['传感器力（IN1）', spec.name, spec.unit, m.name, f'0x{m.frame_id:X}', f'DBC 系数 {spec.factor}，偏移 {spec.offset}；不解析未定义字节', True])

    columns = [row[1] for row in mapping]
    counts = Counter()
    status_counts = defaultdict(Counter)
    stream_counts = defaultdict(Counter)
    frames, unknown, observations = [], Counter(), []
    current_base, timestamps = 16, "absolute"
    elapsed, last_t = 0.0, -math.inf
    for line_number, line in input_lines(asc_path, counts):
        lower = line.lower().strip()
        if lower.startswith("base "):
            current_base = 10 if "base dec" in lower else 16
            timestamps = "relative" if "timestamps relative" in lower else "absolute"
            continue
        parts = line.split()
        if len(parts) < 6 or not re.fullmatch(r"\d+(?:\.\d+)?", parts[0]):
            continue
        counts["timestamped_lines"] += 1
        time = float(parts[0])
        if timestamps == "relative":
            elapsed += time
            time = elapsed
        if not parts[1].isdigit() or parts[3].lower() not in ("rx", "tx") or parts[4].lower() != "d":
            counts["unsupported_or_remote"] += 1
            continue
        try:
            ch = int(parts[1])
            extended = parts[2].lower().endswith("x")
            ident = int(parts[2].rstrip("xX"), current_base)
            dlc = int(parts[5], 10)
            if not 0 <= dlc <= 8 or len(parts) < 6 + dlc:
                raise ValueError("invalid DLC/payload")
            data = bytes(int(v, current_base) for v in parts[6:6 + dlc])
            if ident > (0x1FFFFFFF if extended else 0x7FF):
                raise ValueError("invalid CAN ID")
        except ValueError:
            counts["malformed"] += 1
            continue
        counts["data_frames"] += 1
        if time < last_t:
            counts["out_of_order"] += 1
        last_t = time
        if channel is not None and ch != channel:
            counts["filtered_channel"] += 1
            continue
        if source is not None and extended and (ident & 255) != source:
            counts["filtered_source"] += 1
            continue
        key = (extended, pgn(ident) if extended else ident)
        signals = selection.get(key)
        if not signals:
            unknown[f"0x{ident:X}"] += 1
            continue
        counts["matched_frames"] += 1
        values = {}
        for name, (message, signal, unit) in signals.items():
            try:
                raw, value, status = physical_value(data, signal, extended)
            except ValueError as exc:
                if str(exc) != "short_payload":
                    raise
                raw, value, status = "", None, "short_payload"
            status_counts[name][status] += 1
            stream_counts[name][f"CH{ch}/SA{ident & 255:02X}" if extended else f"CH{ch}/standard"] += 1
            values[name] = value if value is not None else "NaN"
            observations.append([time, ch, f"0x{ident:X}", f"0x{pgn(ident):X}" if extended else "", f"0x{ident & 255:02X}" if extended else "", message.name, name, raw, value if value is not None else "", unit, status, data.hex(" "), line_number])
        frames.append([time, ch, ident, extended, values])
    if not frames:
        raise ValueError("记录中没有与目标 DBC 匹配的报文，请检查 DBC、通道、源地址和 ASC 格式")
    # Always retain separate channel/source rows. GUI plots a chosen stream, never combines ECUs.
    frames.sort(key=lambda f: f[0])
    fuel_streams = defaultdict(list)
    for frame in frames:
        if "EngFuelRate" in frame[4]:
            fuel_streams[(frame[1], frame[2] & 255)].append(frame)
    skipped_seconds = 0.0
    for stream in fuel_streams.values():
        intervals = [b[0] - a[0] for a, b in zip(stream, stream[1:]) if b[0] > a[0]]
        limit = max(2.0, 3 * statistics.median(intervals)) if intervals else 2.0
        total, previous = 0.0, None
        for frame in stream:
            rate = frame[4]["EngFuelRate"]
            if rate == "NaN":
                previous = None
                frame[4]["IntegratedFuel_L"] = "NaN"
                continue
            if previous is not None:
                dt = frame[0] - previous[0]
                if 0 < dt <= limit:
                    total += dt * (rate + previous[4]["EngFuelRate"]) / 7200.0
                elif dt > limit:
                    skipped_seconds += dt
            frame[4]["IntegratedFuel_L"] = total
            previous = frame
    csv_path = output_dir / (asc_path.stem + "_physical.csv")
    write_csv(csv_path, ["Time_s", "CAN_Channel", "CAN_ID", "SourceAddress"] + columns,
              ([f[0], f[1], f"0x{f[2]:X}", f"0x{f[2] & 255:02X}" if f[3] else ""] + [f[4].get(k, "") for k in columns] for f in frames))
    write_csv(output_dir / "decoded_signals_long.csv", ["Time_s", "Channel", "CAN_ID", "PGN", "SourceAddress", "Message", "Signal", "Raw", "Physical", "Unit", "Status", "Payload", "Input_Line"], observations)
    write_csv(output_dir / "signal_mapping.csv", ["物理量", "CSV字段", "单位", "DBC报文", "PGN或标准ID", "说明", "DBC已定义"], mapping)
    report = {
        "input_format": "CAN表格TXT" if counts["table_header"] else "ASC",
        "input": str(asc_path), "input_sha256": hashlib.sha256(asc_path.read_bytes()).hexdigest(),
        "dbcs": [{"path": str(p), "sha256": hashlib.sha256(Path(p).read_bytes()).hexdigest()} for p in dbc_paths],
        "counts": dict(counts), "duration_s": frames[-1][0] - frames[0][0],
        "signal_status_counts": {k: dict(v) for k, v in status_counts.items()},
        "signal_streams": {k: dict(v) for k, v in stream_counts.items()},
        "unmatched_ids": dict(unknown), "integration_skipped_gap_seconds": skipped_seconds,
        "missing_targets": [r[0] for r in mapping if r[1] != "IntegratedFuel_L" and not status_counts[r[1]]["valid"]],
        "rules": ["空单元格代表该报文未更新此信号；NaN 代表无效，均不等于零", "按 J1939 PGN 匹配，保留通道、源地址、原始 ID 和载荷供追溯", "累计燃油只累计记录中可积分区间，断点和无效值不跨越积分", "SensorCAN 保留原 ADC；IN1 仅按单独提供的 kN 标定解析，0x302 不推断为力"],
    }
    (output_dir / "decode_report.json").write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    valid_required = sum(bool(status_counts[r[2]]['valid']) for r in TARGETS if r[1] != 'COMPUTED')
    valid_sensor = sum(bool(status_counts[r[1]]['valid']) for r in mapping[len(TARGETS):])
    summary = f"CAN 记录解析完成：{counts['data_frames']} 帧；目标匹配 {counts['matched_frames']} 帧。\n要求表中的有效报文物理量：{valid_required} 项；另有传感器量：{valid_sensor} 项；记录内燃油积分见 IntegratedFuel_L。\nCSV：{csv_path}\n未取得有效数据：{'、'.join(report['missing_targets']) or '无'}\n映射与质量报告：{output_dir / 'signal_mapping.csv'}；{output_dir / 'decode_report.json'}"
    (output_dir / "解析摘要.txt").write_text(summary, encoding="utf-8-sig")
    return csv_path, summary


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("asc")
    parser.add_argument("out")
    parser.add_argument("dbcs", nargs="+")
    args = parser.parse_args()
    print(decode_asc(args.asc, args.dbcs, args.out)[1])
