package expanse

import "base:intrinsics"

ExpanseContinuous :: struct {
    min, max: f64,
}

// Takes value in [min, max], returns value in [0, 1]
normalizeContinuous :: proc(using expanse: ExpanseContinuous, value: f64) -> f64 {
    return (value - min) / (max - min)
}

// Takes value in [0, 1], returns value in [min, max]
unnormalizeContinuous :: proc(using expanse: ExpanseContinuous, value: f64) -> f64 {
    return min + value * (max - min)
}