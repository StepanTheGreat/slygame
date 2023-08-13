import sdl2

type 
    Surface* = object
        surfacePtr: sdl2.SurfacePtr

proc surface*(size: (int, int), flags: int = 0, depth: int = 0): Surface =
    Surface(
        surfacePtr: sdl2.createRGBSurface(
            flags.cint, 
            size[0].int32, size[1].int32, 
            depth.int32, 
            0u32, 0u32, 0u32, 0u32
        )
    )

proc blit*(sto: var Surface, sfrom: var Surface, pos: (int, int)) =
    let r = sdl2.rect(0, 0, sfrom.surfacePtr.w, sfrom.surfacePtr.h)
    let r2 = sdl2.rect(pos[0].int32, pos[1].int32, sfrom.surfacePtr.w, sfrom.surfacePtr.h)
    sdl2.blitSurface(
        sfrom.surfacePtr,
        unsafeAddr r,
        sto.surfacePtr,
        unsafeAddr r2
    )

# Drawing 

proc fill*(surface: var Surface, color: uint32) = 
    let r = rect(0, 0, surface.surfacePtr.w, surface.surfacePtr.h)
    surface.surfacePtr.fillRect(
        unsafeAddr r,
        color
    )

proc draw_rect*(surface: var Surface, color: uint32, rect: (int, int, int, int)) =
    let r = sdl2.rect(rect[0].cint, rect[1].cint, rect[2].cint, rect[3].cint)

    surface.surfacePtr.fillRect(unsafeAddr r, color)





