package expanse

import "core:fmt"
import "core:math"

ExpansePoint :: struct {
    labels: []string
}

// Takes string in labels, returns value in [0, 1]
normalizePoint :: proc(using expanse: ExpansePoint, label: string) -> f64 {
    index := findIndex(labels, label)
    return f64(index + 1) / f64(len(labels) + 1)
}

// Takes value in [0, 1], returns a label in labels
unnormalizePoint :: proc(using expanse: ExpansePoint, value: f64) -> string {
    value := value * f64((len(labels) + 1)) - 1.0
    index := int(math.round(value)) // This gives the wrong result for value < (1 / len) but let's ignore that for now
    return labels[index]
}

findIndex :: proc(slice: []$T, value: T) -> int {
    for i := 0; i < len(slice); i+= 1 {
        if (slice[i] == value) { return i }
    }
    return -1
}