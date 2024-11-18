package expanse

import "base:intrinsics"

Expanse :: struct {
    variant: union {ExpanseContinuous, ExpansePoint}
}
    
continuous :: proc(min, max: f64) -> Expanse {
    return Expanse{ExpanseContinuous{min, max}}
}

point :: proc(labels: []string) -> Expanse {
    return Expanse{ExpansePoint{labels}}
}

    
// Want the compiler to check that the value matches the variant, i.e.
// either normalize(ExpanseContinuous, f64) or normalize(ExpansePoint, string)
normalize :: proc(using expanse: Expanse, value: any) -> f64 {
    switch v in variant {
    case ExpanseContinuous:
        return normalizeContinuous(v, value)
    case ExpansePoint: 
        return normalizePoint(v, value)
    case: 
        return #panic("Unrecognized expanse type")
    }
}


