import sdl2

proc init*() =
    sdl2.init(sdl2.INIT_EVERYTHING)

proc quit*() =
    sdl2.quit()
