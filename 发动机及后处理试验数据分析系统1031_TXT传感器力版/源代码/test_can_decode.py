import csv
import json
import tempfile
import unittest
from pathlib import Path

from can_decode import SignalSpec, decode_asc, extract_raw, physical_value, pgn

ROOT = Path(__file__).parent


def signal(name='test', start=0, size=16, endian=1, signed=False,
           factor=1, offset=0, low=0, high=0):
    return SignalSpec(name, start, size, endian, signed, factor, offset, low, high, '')


class DecoderTests(unittest.TestCase):
    def test_j1939_pgn_ignores_priority_and_source(self):
        self.assertEqual(pgn(0x0CF00400), pgn(0x18F004FE))
        self.assertEqual(pgn(0x18EAFF00), 0xEA00)  # PDU1 destination excluded

    def test_bit_order_and_signed_scaling(self):
        self.assertEqual(extract_raw(bytes.fromhex('34 12'), signal()), 0x1234)
        self.assertEqual(extract_raw(bytes.fromhex('12 34'), signal(start=7, endian=0)), 0x1234)
        self.assertEqual(physical_value(bytes.fromhex('ff fe'), signal(start=7, endian=0, signed=True))[1], -2)
        rpm = signal('EngSpeed', 24, 16, factor=.125)
        self.assertEqual(physical_value(bytes.fromhex('70 7d 95 1c 19 00 f3 96'), rpm, True)[1], 803.5)

    def test_invalid_is_not_zero_and_adc_is_not_reserved(self):
        self.assertEqual(physical_value(b'\xff\xff', signal(), True)[2], 'not_available')
        self.assertEqual(physical_value(b'\x00\xfe', signal(), True)[2], 'error_code')
        self.assertEqual(physical_value(b'\xff\xff', signal(), False)[1], 65535)
        fuel = signal('EngFuelTemp1', size=8, offset=-40, low=-40, high=210)
        self.assertEqual(physical_value(b'\x00', fuel, True)[2], 'sensor_invalid_minus40')
        self.assertEqual(physical_value(b'\x00', signal(size=8), True)[1], 0)

    def test_sparse_export_sources_and_integral_gap(self):
        with tempfile.TemporaryDirectory() as folder:
            folder = Path(folder)
            asc = folder / 'fixture.asc'
            asc.write_text('base hex timestamps absolute\n'
                '0.0 1 cf00400x Rx d 8 70 7d 95 1c 19 00 f3 96\n'
                '0.0 1 cf00403x Rx d 8 70 7d 96 40 1f 00 f3 96\n'
                '0.1 1 18fef200x Rx d 8 48 00 ff ff ff ff ff ff\n'
                '1.1 1 18fef200x Rx d 8 48 00 ff ff ff ff ff ff\n'
                '2.1 1 18fef200x Rx d 8 ff ff ff ff ff ff ff ff\n'
                '3.1 1 18fef200x Rx d 8 48 00 ff ff ff ff ff ff\n'
                '4.1 1 18fef200x Rx d 8 48 00 ff ff ff ff ff ff\n'
                '14.1 1 18fef200x Rx d 8 48 00 ff ff ff ff ff ff\n'
                '15.1 2 7b Rx d 8 34 12 ff fe 00 00 00 00\n', encoding='utf-8')
            path, _ = decode_asc(asc, [ROOT/'j1939.dbc', ROOT/'SensorCAN.dbc'], folder/'out')
            with path.open(encoding='utf-8-sig', newline='') as stream:
                rows = list(csv.DictReader(stream))
            self.assertEqual(rows[0]['EngSpeed'], '803.5')
            self.assertEqual(rows[1]['EngSpeed'], '1000.0')
            self.assertEqual(rows[1]['SourceAddress'], '0x03')
            self.assertEqual(rows[2]['EngSpeed'], '')  # Never forward filled
            self.assertEqual(rows[4]['EngFuelRate'], 'NaN')
            self.assertAlmostEqual(float(rows[-2]['IntegratedFuel_L']), .002)
            self.assertEqual(rows[-1]['AI11_ADC'], '4660.0')
            report = json.loads((folder/'out'/'decode_report.json').read_text(encoding='utf-8'))
            self.assertEqual(report['integration_skipped_gap_seconds'], 10)
            self.assertIn('发动机输入电压', report['missing_targets'])


    def test_table_txt_and_latest_calibrated_force(self):
        with tempfile.TemporaryDirectory() as folder:
            folder = Path(folder)
            sample = folder / 'capture.txt'
            header = '编号,系统时间,时间标识,CAN通道,ID号,帧类型,帧格式,CAN类型,长度,数据\n'
            sample.write_text(header + '0,="12:10:46.110826",0,ch1,0x301,数据帧,标准帧,CAN,8,x| 09 C4 00 00 00 00 00 00\n'
                + '1,="12:10:46.2",0.1,ch2,0xCF00400,数据帧,扩展帧,CAN,8,x| 00 00 7D 80 3E 00 00 00\n'
                + '2,="12:10:46.3",0.2,ch1,0x302,数据帧,标准帧,CAN,8,x| 09 C4 00 00 00 00 00 00\n'
                + '3,="12:10:46.4",0.3,ch1,0x301,数据帧,标准帧,CAN,8,x| 00 00 00 00 00 00 00 00\n'
                + '4,="12:10:46.5",0.4,ch1,0x301,数据帧,标准帧,CAN,8,x| 61 A9 00 00 00 00 00 00\n'
                + '5,="12:10:46.6",0.5,ch1,0x301,数据帧,标准帧,CAN,8,x| 09 C4\n',encoding='gb18030')
            result, _ = decode_asc(sample,[ROOT/'j1939.dbc',ROOT/'adc_in1_force_10kN.dbc'],folder/'out')
            with result.open(encoding='utf-8-sig',newline='') as stream: rows=list(csv.DictReader(stream))
            self.assertEqual(len(rows),4)
            self.assertEqual(rows[0]['IN1_Force_kN'],'5.0')
            self.assertEqual(rows[0]['EngSpeed'],'')
            self.assertEqual(rows[1]['EngSpeed'],'2000.0')
            self.assertEqual(rows[2]['IN1_Force_kN'],'0.0')
            self.assertEqual(rows[3]['IN1_Force_kN'],'NaN')
            report=json.loads((folder/'out/decode_report.json').read_text(encoding='utf-8'))
            self.assertEqual(report['input_format'],'CAN表格TXT')
            self.assertEqual(report['counts']['malformed'],1)
            self.assertEqual(report['unmatched_ids']['0x302'],1)
            self.assertEqual(report['signal_streams']['IN1_Force_kN']['CH1/standard'],3)


if __name__ == '__main__':
    unittest.main()
