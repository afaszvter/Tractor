# MWORKS.Syslab 2026b. Shared plot helpers and compatibility with earlier six-channel CSV.
using TyPlot
using TyMath
using TOML

struct Signal
    t::Vector{Float64}
    y::Vector{Float64}
end

const CHANNELS = ("EngFuelRate", "EngSpeed", "EngIntakeAirMassFlowRate",
                  "PullA", "PullB", "PullC")

function load_can_csv(path::AbstractString)
    isfile(path) || error("CSV file not found: $path")
    lines = readlines(path)
    length(lines) > 1 || error("CSV contains no data")
    names = strip.(split(replace(lines[1], '\ufeff' => ""), ','))
    indexes = Dict(name => findfirst(==(name), names) for name in CHANNELS)
    any(isnothing, values(indexes)) && error("CSV header is missing a required channel")
    ts = Dict(name => Float64[] for name in CHANNELS)
    ys = Dict(name => Float64[] for name in CHANNELS)
    for line in lines[2:end]
        fields = split(line, ','; keepempty=true)
        length(fields) < length(names) && continue
        t = tryparse(Float64, strip(fields[1]))
        t === nothing && continue
        for name in CHANNELS
            s = strip(fields[indexes[name]])
            isempty(s) && continue  # asynchronous CAN channels: blank is not zero
            value = tryparse(Float64, s)
            (value === nothing || !isfinite(value)) && continue
            if startswith(name, "Pull") && value >= 65535
                value = NaN  # keep a gap in the time plot; never join across 0xffff
            end
            push!(ts[name], t)
            push!(ys[name], value)
        end
    end
    signals = Dict(name => Signal(ts[name], ys[name]) for name in CHANNELS)
    any(isempty(signals[name].t) for name in CHANNELS) && error("At least one channel is empty")
    t0 = minimum(first(signals[name].t) for name in CHANNELS)
    for name in CHANNELS
        signals[name] = Signal(signals[name].t .- t0, signals[name].y)
    end
    return signals
end

function apply_plot_style(fig, style_path)
    isempty(style_path) && return
    isfile(style_path) || return
    settings = TOML.parsefile(style_path)
    layout_files = Dict("time"=>"01_time_domain", "spectrum"=>"02_speed_spectrum", "points"=>"03_operating_points",
        "distribution"=>"04_force_distribution", "temperature"=>"05_temperature", "pressure"=>"06_pressure_levels",
        "electrical"=>"07_electrical", "sensor"=>"08_sensor_adc", "controls"=>"09_controls", "counters"=>"10_counters",
        "force"=>"11_sensor_force", "force_distribution"=>"12_sensor_force_distribution")
    mode = replace(basename(style_path), "plot_style_"=>"", ".toml"=>"")
    layout_file = joinpath(dirname(style_path), get(layout_files, mode, "") * ".panels.toml")
    keys = isfile(layout_file) ? get(TOML.parsefile(layout_file), "keys", String[]) : String[]
    for (index, ax) in enumerate(fig.axes)
        panel = get(settings, "panel$(index)", nothing)
        if index <= length(keys)
            matches = [p for p in values(settings) if p isa AbstractDict && get(p, "field_key", "") == keys[index]]
            panel = isempty(matches) ? nothing : first(matches)
        end
        panel === nothing && continue
        title_font = get(panel, "title_font", "SimSun")
        axis_font = get(panel, "axis_font", "Times New Roman")
        title_size = get(panel, "title_size", 12)
        axis_size = get(panel, "axis_size", 11)
        tick_size = get(panel, "tick_size", 10)
        plt_set(ax, "fontname", axis_font)
        plt_set(ax, "fontsize", tick_size)
        if haskey(panel, "title")
            text = panel["title"]
            font = any(c -> '\u4e00' <= c <= '\u9fff', text) && title_font in ("Times New Roman", "Arial") ? "SimSun" : title_font
            title(ax, text; fontname=font, fontsize=title_size)
        elseif !isempty(ax.get_title())
            title(ax, ax.get_title(); fontname=title_font, fontsize=title_size)
        else
            for annotation in ax.texts
                annotation.set_fontsize(title_size)
            end
        end
        xtext = get(panel, "xlabel", ax.get_xlabel())
        ytext = get(panel, "ylabel", ax.get_ylabel())
        xfont = any(c -> '\u4e00' <= c <= '\u9fff', xtext) && axis_font in ("Times New Roman", "Arial") ? "SimSun" : axis_font
        yfont = any(c -> '\u4e00' <= c <= '\u9fff', ytext) && axis_font in ("Times New Roman", "Arial") ? "SimSun" : axis_font
        xlabel(ax, xtext; fontname=xfont, fontsize=axis_size)
        ylabel(ax, ytext; fontname=yfont, fontsize=axis_size)
        ax.tick_params(labelsize=tick_size)
        xargs = Dict{Symbol,Float64}()
        yargs = Dict{Symbol,Float64}()
        haskey(panel, "xmin") && (xargs[:left] = Float64(panel["xmin"]))
        haskey(panel, "xmax") && (xargs[:right] = Float64(panel["xmax"]))
        haskey(panel, "ymin") && (yargs[:bottom] = Float64(panel["ymin"]))
        haskey(panel, "ymax") && (yargs[:top] = Float64(panel["ymax"]))
        isempty(xargs) || ax.set_xlim(; xargs...)
        isempty(yargs) || ax.set_ylim(; yargs...)
        legend_mode = get(panel, "legend", "keep")
        if legend_mode != "keep"
            legend(ax, "off")
            if legend_mode == "show"
                labels = get(panel, "legend_labels", String[])
                !isempty(labels) && legend(ax, labels; location="best",
                                           fontname=axis_font, fontsize=axis_size)
            end
        end
    end
end

function save_plot(fig, output_dir, stem; style_path="")
    apply_plot_style(fig, style_path)
    mkpath(output_dir)
    target = joinpath(output_dir, stem * ".png")
    exportgraphics(fig, target; resolution=300)
    println("Saved: " * target)
    return target
end

function report_figure(name, width, height)
    fig = figure(name=name)
    fig.set_size_inches(width, height)
    return fig
end

function style_axes(chinese_title, y_label; x_label="")
    ax = gca()
    plt_set(ax, "fontname", "Times New Roman")
    plt_set(ax, "fontsize", 10)
    title(chinese_title; fontname="SimSun", fontsize=12, fontweight="normal")
    ax.title.set_fontfamily(["Times New Roman", "SimSun"])
    ylabel(y_label; fontname="Times New Roman", fontsize=11)
    if !isempty(x_label)
        xlabel(x_label; fontname="Times New Roman", fontsize=11)
    end
    grid("on")
end

function mixed_title(chinese_part, latin_part)
    ax = gca()
    ax.text(0.515, 1.02, chinese_part; transform=ax.transAxes,
            horizontalalignment="right", verticalalignment="bottom",
            fontname="SimSun", fontsize=12)
    ax.text(0.515, 1.02, latin_part; transform=ax.transAxes,
            horizontalalignment="left", verticalalignment="bottom",
            fontname="Times New Roman", fontsize=12)
end

function time_domain(d, out; style_path="")
    f = report_figure("CAN time domain", 11.0, 9.0)
    tmax = maximum(last(d[name].t) for name in CHANNELS)
    subplot(4, 1, 1)
    for (name, color) in (("PullA", "#254E70"), ("PullB", "#C45A3B"), ("PullC", "#397D6A"))
        s = d[name]
        hold("on")
        scale = name == "PullC" ? 2000.0 : 1000.0
        plot(s.t, s.y ./ scale; color=color, linewidth=0.75)
    end
    hold("off")
    style_axes("拉力", "Force (kN)")
    legend(["A", "B", "C/2"]; location="upper left", fontname="Times New Roman", fontsize=9)
    xlim([0, tmax])
    for (panel, name, label, unit, color) in ((2,"EngSpeed","发动机转速","Speed (rpm)","#254E70"),
                                              (3,"EngFuelRate","燃油流量","Fuel rate (L/h)","#C45A3B"),
                                              (4,"EngIntakeAirMassFlowRate","进气质量流量","Air flow (kg/h)","#397D6A"))
        subplot(4, 1, panel)
        s = d[name]
        plot(s.t, s.y; color=color, linewidth=0.8)
        style_axes(label, unit; x_label=panel == 4 ? "Time (s)" : "")
        xlim([0, tmax])
    end
    save_plot(f, out, "01_time_domain"; style_path=style_path)
end

function engine_spectrum(d, out; style_path="")
    s = d["EngSpeed"]
    # Engine speed is about 100 Hz. Take every 10th point for a 0–5 Hz view.
    t = s.t[1:10:end]
    y = s.y[1:10:end]
    n = length(y)
    n > 64 || error("Insufficient engine-speed samples for spectrum")
    dt = sort(diff(t))[cld(n-1, 2)]
    fs = 1 / dt
    x = y .- sum(y) / n
    window = 0.5 .- 0.5 .* cos.(2pi .* (0:n-1) ./ (n-1))
    spec = abs.(TyMath.fft(x .* window)) ./ sum(window)
    half = fld(n, 2) + 1
    amplitude = 2 .* spec[1:half]
    amplitude[1] /= 2
    freq = (0:half-1) .* (fs / n)
    f = report_figure("Engine-speed spectrum", 9.0, 7.0)
    subplot(2, 1, 1)
    plot(freq, amplitude; color="#254E70", linewidth=0.9)
    style_axes("发动机转速频谱", "Amplitude (rpm)")
    xlim([0, min(5.0, fs/2)])
    subplot(2, 1, 2)
    plot(freq, amplitude; color="#C45A3B", linewidth=1.0)
    style_axes("低频细节", "Amplitude (rpm)"; x_label="Frequency (Hz)")
    xlim([0, min(0.6, fs/2)])
    save_plot(f, out, "02_speed_spectrum"; style_path=style_path)
end

function nearest_values(reference::Signal, query_t::Vector{Float64}; max_gap=0.055)
    x = Float64[]; y = Int[]
    for (i, t) in enumerate(query_t)
        j = searchsortedfirst(reference.t, t)
        candidates = filter(k -> 1 <= k <= length(reference.t), [j-1, j])
        isempty(candidates) && continue
        k = candidates[argmin(abs.(reference.t[candidates] .- t))]
        if abs(reference.t[k] - t) <= max_gap
            push!(x, reference.y[k]); push!(y, i)
        end
    end
    return x, y
end

function working_points(d, out; style_path="")
    fuel = d["EngFuelRate"]
    rpm, ids = nearest_values(d["EngSpeed"], fuel.t)
    length(ids) > 10 || error("Too few matched work points")
    rate = fuel.y[ids]
    f = report_figure("Engine operating points", 8.8, 6.2)
    scatter(rpm, rate, 9; color="#254E70", alpha=0.32)
    style_axes("发动机工作点分布", "Fuel rate (L/h)"; x_label="Engine speed (rpm)")
    save_plot(f, out, "03_operating_points"; style_path=style_path)
end

function force_histogram(values; high=66.0)
    edges = collect(range(0, high, length=31))
    counts = zeros(Int, length(edges)-1)
    for v in values
        j = clamp(searchsortedlast(edges, v), 1, length(counts))
        counts[j] += 1
    end
    centers = (edges[1:end-1] .+ edges[2:end]) ./ 2
    return centers, counts
end

function force_distribution(d, out; style_path="")
    a = filter(isfinite, d["PullB"].y) ./ 1000  # B has fewer invalid samples
    f = report_figure("Drawbar-force distribution", 9.0, 5.2)
    centers, counts = force_histogram(filter(v -> v != 0.0, a))
    bar(centers, counts; facecolor="#397D6A")
    style_axes("拉力分布：作业样本", "Count"; x_label="Pull B (kN)")
    save_plot(f, out, "04_force_distribution"; style_path=style_path)
end

function run_analysis(csv_path::AbstractString; output_dir=joinpath(dirname(csv_path), "syslab_figures"))
    d = load_can_csv(csv_path)
    time_domain(d, output_dir)
    engine_spectrum(d, output_dir)
    working_points(d, output_dir)
    force_distribution(d, output_dir)
    return d
end
