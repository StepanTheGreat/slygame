proc extractRGB*(color: uint32): (uint8, uint8, uint8, uint8) =
    (
        (color shr 24).uint8,
        (color shr 16).uint8,
        (color shr 8).uint8,
        255.uint8,
    )