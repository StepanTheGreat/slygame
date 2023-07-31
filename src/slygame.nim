import sdl2

const 
    QUIT* = sdl2.QuitEvent.uint
    ACTIVEEVENT* = sdl2.WindowEvent_FocusGained.uint
    KEYDOWN* = sdl2.KeyDown.uint
    KEYUP* = sdl2.KeyDown.uint
    MOUSEMOTION* = sdl2.MouseMotion.uint
    MOUSEBUTTONUP* = sdl2.MouseButtonUp.uint
    MOUSEBUTTONDOWN* = sdl2.MouseButtonDown.uint
    USEREVENT* = sdl2.UserEvent.uint

proc init*() =
    sdl2.init(sdl2.INIT_EVERYTHING)

proc quit*() =
    sdl2.quit()
