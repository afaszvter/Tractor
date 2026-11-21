const FORCE_ZERO_TOLERANCE = 0.0
force_active(value; threshold=FORCE_ZERO_TOLERANCE) = isfinite(value) && abs(value) > threshold
function force_window(t, y; occupancy=0.8, threshold=FORCE_ZERO_TOLERANCE, focus_fraction=0.05)
    length(t) == length(y) || throw(ArgumentError("time/value lengths differ"))
    0 < occupancy <= 1 || throw(ArgumentError("invalid occupancy"))
    ids = findall(i -> isfinite(t[i]) && force_active(y[i]; threshold=threshold), eachindex(y))
    isempty(ids) && return nothing
    focus_level = maximum(abs.(y[ids])) * focus_fraction
    focused = filter(i -> abs(y[i]) >= focus_level, ids)
    first_time = minimum(t[focused]); last_time = maximum(t[focused])
    width = max(last_time-first_time, 1.0) / occupancy
    lower = max(0.0, (first_time+last_time-width)/2)
    return (lower, lower+width)
end
force_values(y; threshold=FORCE_ZERO_TOLERANCE) = filter(value -> force_active(value; threshold=threshold), y)
