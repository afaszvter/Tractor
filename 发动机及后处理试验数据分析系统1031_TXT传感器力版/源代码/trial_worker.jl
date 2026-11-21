include(joinpath(@__DIR__, "Syslab_CAN_Analysis.jl"))
using Statistics
include(joinpath(@__DIR__, "force_plot_rules.jl"))
const TRIAL_SOURCES = Dict{String,Tuple{String,String}}()
const TRIAL_ALTERNATES = Dict{String,Any}()

const TRIAL_FIELDS = ("WheelBasedVehicleSpeed", "BarometricPress", "EngSpeed", "ActualEngPercentTorque",
    "ActlMaxAvailableEngPercentTorque", "AccelPedalPos1", "EngOilLevel", "EngCoolantLevel",
    "EngFuelDeliveryPress", "EngOilPress", "AmbientAirTemp", "EngCoolantTemp", "EngFuelTemp1",
    "EngOilTemp1", "EngTotalHoursOfOperation", "EngTotalRevolutions", "EngFuelRate", "EngTripFuel",
    "IntegratedFuel_L", "BatteryPotential_PowerInput1", "KeyswitchBatteryPotential", "ChargingSystemPotential",
    "AI11_ADC", "AI16_ADC", "AI18_ADC", "IN1_Force_kN")

function load_trial_csv(path)
    empty!(TRIAL_SOURCES)
    empty!(TRIAL_ALTERNATES)
    lines = readlines(path)
    names = strip.(split(replace(lines[1], '\ufeff' => ""), ','))
    all(x -> x in names, CHANNELS) && return load_can_csv(path), true
    "Time_s" in names || error("CSV 必须为 ASC 解析导出的物理量文件，或旧版六通道 CSV")
    columns = Dict(n => i for (i, n) in enumerate(names))
    groups = Dict{Tuple{String,String,String},Tuple{Vector{Float64},Vector{Float64}}}()
    for line in lines[2:end]
        fields = split(line, ','; keepempty=true)
        length(fields) < length(names) && continue
        t = tryparse(Float64, fields[columns["Time_s"]])
        t === nothing && continue
        ch = haskey(columns, "CAN_Channel") ? fields[columns["CAN_Channel"]] : "1"
        sa = haskey(columns, "SourceAddress") ? fields[columns["SourceAddress"]] : ""
        wanted_ch = get(ENV, "TRIAL_CHANNEL", "")
        wanted_sa = get(ENV, "TRIAL_SOURCE", "")
        !isempty(wanted_ch) && ch != wanted_ch && continue
        !isempty(wanted_sa) && !isempty(sa) && lowercase(sa) != lowercase(wanted_sa) && continue
        for name in TRIAL_FIELDS
            haskey(columns, name) || continue
            text = fields[columns[name]]
            isempty(text) && continue
            value = tryparse(Float64, text)
            value === nothing && continue
            series = get!(groups, (name, ch, sa), (Float64[], Float64[]))
            push!(series[1], t); push!(series[2], value)
        end
    end
    result = Dict{String,Signal}()
    for name in TRIAL_FIELDS
        candidates = [k for k in keys(groups) if k[1] == name]
        if isempty(candidates)
            result[name] = Signal(Float64[], Float64[])
        else
            sort!(candidates; by=k -> (any(isfinite, groups[k][2]) ? 0 : 1, k[3] == "0x00" ? 0 : 1, -count(isfinite, groups[k][2]), k[2], k[3]))
            TRIAL_ALTERNATES[name] = [(signal=Signal(groups[k][1][sortperm(groups[k][1])], groups[k][2][sortperm(groups[k][1])]), channel=k[2], source=k[3]) for k in candidates if any(isfinite, groups[k][2])]
            chosen = first(candidates)
            TRIAL_SOURCES[name] = (chosen[2], chosen[3])
            t, y = groups[chosen]
            order = sortperm(t)
            result[name] = Signal(t[order], y[order])
            println("Plot source: ", name, " CH", chosen[2], " SA=", chosen[3], " valid=", count(isfinite, y))
        end
    end
    return result, false
end

function no_data(label="记录中无有效数据")
    ax = gca()
    ax.set_xticks([])
    ax.set_yticks([])
    ax.text(0.5, 0.5, label; transform=ax.transAxes, ha="center", va="center", fontname="SimSun", fontsize=12)
end

function record_layout(out, stem, keys, labels; reason="")
    mkpath(out)
    open(joinpath(out, stem * ".panels.toml"), "w") do io
        TOML.print(io, Dict("keys" => keys, "labels" => labels, "generated" => !isempty(keys), "reason" => reason))
    end
    if isempty(keys)
        target = joinpath(out, stem * ".png")
        isfile(target) && rm(target)
        println("Skipped: ", stem, " · ", reason)
    end
    return !isempty(keys)
end

function trial_panels(d, out, stem, specs; style_path="")
    missing = [spec[2] for spec in specs if !any(isfinite, d[spec[1]].y)]
    specs = filter(spec -> any(isfinite, d[spec[1]].y), collect(specs))
    isempty(missing) || println("Omitted panels: ", stem, " · ", join(missing, "、"))
    record_layout(out, stem, [s[1] for s in specs], [s[2] for s in specs]; reason="所需字段均无有效数据") || return
    f = report_figure(stem, 10.5, length(specs) * 2.1 + 0.7)
    for (i, (key, caption, unit, color)) in enumerate(specs)
        subplot(length(specs), 1, i)
        s = d[key]
        alternatives = get(TRIAL_ALTERNATES, key, [])
        if key == "WheelBasedVehicleSpeed" && length(alternatives) > 1
            hold("on")
            labels = String[]
            for (j, alternative) in enumerate(alternatives)
                a = alternative.signal
                plot(a.t, a.y; color=isodd(j) ? "#254E70" : "#C45A3B", linewidth=1.0)
                push!(labels, "CAN " * alternative.channel * " / SA " * alternative.source)
            end
            hold("off")
            legend(labels; location="best", fontname="Times New Roman", fontsize=9)
        else
            if count(isfinite, s.y) == 1
                ids = findall(isfinite, s.y)
                scatter(s.t[ids], s.y[ids], 20; color=color)
            else
                plot(s.t, s.y; color=color, linewidth=1.0)
            end
        end
        style_axes(caption, unit; x_label=i == length(specs) ? "Time (s)" : "")
    end
    save_plot(f, out, stem; style_path=style_path)
end

function trial_time(d, out; style_path="")
    trial_panels(d, out, "01_time_domain", (
        ("EngSpeed", "发动机转速", "Engine speed (rpm)", "#254E70"),
        ("EngFuelRate", "发动机燃油消耗率", "Fuel rate (L/h)", "#C45A3B"),
        ("ActualEngPercentTorque", "发动机实际扭矩百分比", "Actual torque (%)", "#397D6A"),
        ("WheelBasedVehicleSpeed", "车辆速度", "Vehicle speed (km/h)", "#805B87")); style_path=style_path)
end

function trial_spectrum(d, out; style_path="")
    s = d["EngSpeed"]
    good = findall(isfinite, s.y)
    # Use only the longest contiguous valid segment, split at missing values and long gaps.
    segments = Vector{Vector{Int}}(); current = Int[]
    dt_candidates = filter(>(0.0), diff(s.t))
    dt = isempty(dt_candidates) ? 0.0 : median(dt_candidates)
    for index in good
        if !isempty(current) && (index != last(current) + 1 || s.t[index] - s.t[last(current)] > 3dt)
            push!(segments, current); current = Int[]
        end
        push!(current, index)
    end
    isempty(current) || push!(segments, current)
    ids = isempty(segments) ? Int[] : segments[argmax(length.(segments))]
    if length(ids) < 32 || dt <= 0
        record_layout(out, "02_speed_spectrum", String[], String[]; reason="连续有效转速不足 32 点或采样间隔无效")
        return
    end
    record_layout(out, "02_speed_spectrum", ["spectrum", "spectrum_low"], ["转速频谱", "低频细节"])
    f = report_figure("Engine speed spectrum", 10.0, 6.7)
    for panel in 1:2
        subplot(2, 1, panel)
        if length(ids) < 32 || dt <= 0
            no_data("有效连续转速样本不足，无法计算频谱")
        else
            t, y = s.t[ids], s.y[ids]
            uniform = collect(first(t):dt:last(t))
            # Linear resampling handles ASC bus scheduling jitter; never cross a missing segment.
            uniform_y = Float64[]
            for instant in uniform
                j = clamp(searchsortedlast(t, instant), 1, length(t)-1)
                ratio = (instant - t[j]) / max(t[j+1] - t[j], eps())
                push!(uniform_y, y[j] + ratio * (y[j+1] - y[j]))
            end
            n = length(uniform_y)
            window = 0.5 .- 0.5 .* cos.(2pi .* (0:n-1) ./ (n-1))
            spectrum = 2 .* abs.(TyMath.fft((uniform_y .- mean(uniform_y)) .* window)) ./ sum(window)
            spectrum[1] /= 2
            iseven(n) && (spectrum[fld(n,2)+1] /= 2)
            freq = (0:fld(n,2)) ./ (n*dt)
            plot(freq, spectrum[1:length(freq)]; color=panel == 1 ? "#254E70" : "#C45A3B", linewidth=1.0)
            xlim([0, min(panel == 1 ? 20.0 : 2.0, 1/(2dt))])
            panel == 1 && println("Spectrum: longest valid segment ", first(t), "..", last(t), " s; dt=", dt, " s; resolution=", 1/(n*dt), " Hz")
        end
        style_axes(panel == 1 ? "发动机转速频谱" : "转速频谱低频细节", "Amplitude (rpm)"; x_label=panel == 2 ? "Frequency (Hz)" : "")
    end
    save_plot(f, out, "02_speed_spectrum"; style_path=style_path)
end

function trial_points(d, out; style_path="")
    speed, torque = d["EngSpeed"], d["ActualEngPercentTorque"]
    x, y = Float64[], Float64[]
    same_source = get(TRIAL_SOURCES, "EngSpeed", nothing) == get(TRIAL_SOURCES, "ActualEngPercentTorque", nothing)
    # Both signals originate in EEC1; match only the same timestamp, never nearby frames.
    lookup = Dict(t => v for (t,v) in zip(speed.t, speed.y))
    for (t,v) in zip(torque.t, torque.y)
        u = get(lookup, t, NaN)
        if same_source && isfinite(u) && isfinite(v)
            push!(x,u); push!(y,v)
        end
    end
    if isempty(x)
        record_layout(out, "03_operating_points", String[], String[]; reason=same_source ? "无有效的转速与扭矩配对样本" : "两信号来源不同，请指定同一通道和源地址")
        return
    end
    record_layout(out, "03_operating_points", ["speed_torque"], ["转速与扭矩工作点"])
    f = report_figure("Engine operating points", 10.0, 6.4)
    scatter(x,y,12; color="#397D6A", alpha=0.6)
    style_axes("发动机转速与实际扭矩工作点", "Actual torque (%)"; x_label="Engine speed (rpm)")
    save_plot(f, out, "03_operating_points"; style_path=style_path)
end

function trial_distribution(d, out; style_path="")
    specs = filter(s -> any(isfinite, d[s[1]].y), [("EngSpeed", "发动机转速分布", "Engine speed (rpm)"), ("ActualEngPercentTorque", "发动机实际扭矩分布", "Actual torque (%)")])
    record_layout(out, "04_force_distribution", [s[1] for s in specs], [s[2] for s in specs]; reason="转速和扭矩均无有效数据") || return
    f = report_figure("Engine distribution", 10.0, 2.7 * length(specs) + 1)
    for (i, (key, caption, unit)) in enumerate(specs)
        subplot(length(specs),1,i)
        values = filter(isfinite, d[key].y)
        isempty(values) ? no_data() : hist(values, 25)
        style_axes(caption, "Count"; x_label=unit)
    end
    save_plot(f, out, "04_force_distribution"; style_path=style_path)
end

function trial_temperature(d, out; style_path="")
    trial_panels(d,out,"05_temperature", (
        ("EngCoolantTemp", "发动机冷却液温度", "Coolant temperature (deg C)", "#254E70"),
        ("EngOilTemp1", "发动机机油温度", "Oil temperature (deg C)", "#C45A3B"),
        ("EngFuelTemp1", "发动机燃油温度", "Fuel temperature (deg C)", "#397D6A"),
        ("AmbientAirTemp", "大气温度", "Ambient temperature (deg C)", "#805B87")); style_path=style_path)
end

function trial_pressure(d, out; style_path="")
    trial_panels(d,out,"06_pressure_levels", (
        ("EngOilPress", "发动机机油压力", "Oil pressure (kPa)", "#254E70"),
        ("BarometricPress", "大气压力", "Barometric pressure (kPa)", "#C45A3B"),
        ("EngFuelDeliveryPress", "发动机燃油输出压力", "Fuel delivery pressure (kPa)", "#805B87"),
        ("EngOilLevel", "发动机机油油位", "Oil level (%)", "#397D6A"),
        ("EngCoolantLevel", "发动机冷却液液位", "Coolant level (%)", "#805B87")); style_path=style_path)
end

function trial_electrical(d, out; style_path="")
    trial_panels(d,out,"07_electrical", (
        ("BatteryPotential_PowerInput1", "发动机输入电压", "ECU supply voltage (V)", "#254E70"),
        ("KeyswitchBatteryPotential", "点火开关电压", "Keyswitch voltage (V)", "#C45A3B"),
        ("ChargingSystemPotential", "充电系统输出电压", "Charging voltage (V)", "#397D6A")); style_path=style_path)
end

function trial_sensor(d, out; style_path="")
    trial_panels(d,out,"08_sensor_adc", (
        ("AI11_ADC", "传感器 AI11 原始采样", "AI11 (ADC count)", "#254E70"),
        ("AI16_ADC", "传感器 AI16 原始采样", "AI16 (ADC count)", "#C45A3B"),
        ("AI18_ADC", "传感器 AI18 原始采样", "AI18 (ADC count)", "#397D6A")); style_path=style_path)
end

function trial_force(d, out; style_path="")
    s = d["IN1_Force_kN"]
    limits = force_window(s.t, s.y)
    record_layout(out, "11_sensor_force", limits === nothing ? String[] : ["IN1_Force_kN"],
        limits === nothing ? String[] : ["传感器力（IN1）"]; reason="未取得有效非零力样本") || return
    values = [force_active(value) ? value : NaN for value in s.y]
    f = report_figure("IN1 force", 10.5, 4.8)
    if count(isfinite, values) == 1
        ids = findall(isfinite, values)
        scatter(s.t[ids], values[ids], 20; color="#254E70")
    else
        plot(s.t,values; color="#254E70",linewidth=1.0)
    end
    style_axes("传感器力（IN1）", "Force (kN)"; x_label="Time (s)")
    xlim([limits[1],limits[2]])
    save_plot(f,out,"11_sensor_force"; style_path=style_path)
end

function trial_force_distribution(d, out; style_path="")
    values = force_values(d["IN1_Force_kN"].y)
    record_layout(out, "12_sensor_force_distribution", isempty(values) ? String[] : ["IN1_Force_kN"],
        isempty(values) ? String[] : ["拉力分布：作业样本"]; reason="未取得有效非零力样本") || return
    f = report_figure("Force distribution", 10.0, 6.4)
    hist(values,25)
    style_axes("拉力分布：作业样本", "Count"; x_label="Force (kN)")
    low, high = extrema(values)
    if high > low
        xlim([low, high+(high-low)*0.03])
    end
    save_plot(f,out,"12_sensor_force_distribution"; style_path=style_path)
end

function trial_controls(d, out; style_path="")
    trial_panels(d,out,"09_controls", (
        ("AccelPedalPos1", "油门踏板开度", "Accelerator pedal (%)", "#254E70"),
        ("ActlMaxAvailableEngPercentTorque", "实际最大可利用发动机扭矩百分比", "Available torque (%)", "#397D6A")); style_path=style_path)
end

function trial_counters(d, out; style_path="")
    trial_panels(d,out,"10_counters", (
        ("EngTotalHoursOfOperation", "发动机累积工作时间", "Total operation (h)", "#254E70"),
        ("EngTotalRevolutions", "发动机总转数", "Total revolutions (r)", "#C45A3B"),
        ("EngTripFuel", "发动机行程燃油", "Trip fuel (L)", "#397D6A"),
        ("IntegratedFuel_L", "本次记录累计燃油消耗量", "Recorded fuel (L)", "#805B87")); style_path=style_path)
end

length(ARGS) == 3 || error("usage: trial_worker.jl MODE CSV OUTPUT")
mode, csv_path, output_dir = ARGS
d, legacy = load_trial_csv(csv_path)
style_path(name) = joinpath(output_dir, "plot_style_" * name * ".toml")
actions = legacy ? Dict("time" => time_domain, "spectrum" => engine_spectrum, "points" => working_points, "distribution" => force_distribution) :
    Dict("time" => trial_time, "spectrum" => trial_spectrum, "points" => trial_points, "distribution" => trial_distribution,
         "temperature" => trial_temperature, "pressure" => trial_pressure, "electrical" => trial_electrical, "sensor" => trial_sensor,
         "controls" => trial_controls, "counters" => trial_counters,
         "force" => trial_force, "force_distribution" => trial_force_distribution)
if mode == "all"
    for name in ("time", "spectrum", "points", "distribution", "temperature", "pressure", "electrical", "sensor", "controls", "counters", "force", "force_distribution")
        haskey(actions,name) && actions[name](d,output_dir; style_path=style_path(name))
    end
elseif haskey(actions,mode)
    actions[mode](d,output_dir; style_path=style_path(mode))
else
    error("旧版六通道数据不包含此分析所需字段，请导入 ASC 或解析后的物理量 CSV")
end
