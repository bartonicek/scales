package main
import "core:fmt"

main :: proc() {
    labels := []string{"foo", "bar", "baz"}
    domain := expanse.point(labels)
    codomain := expanse.continuous(0.0, 400.0)

    // Example use
    expanse.unnormalize(expanse.normalize(domain, "foo")) // 100
}
