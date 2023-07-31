import sdl2

const 
    QUIT* = sdl2.QuitEvent
    KEYDOWN* = sdl2.KeyDown
    KEYUP* = sdl2.KeyDown
    MOUSEMOTION* = sdl2.MouseMotion
    MOUSEBUTTONUP* = sdl2.MouseButtonUp
    MOUSEBUTTONDOWN* = sdl2.MouseButtonDown
    USEREVENT* = sdl2.UserEvent

proc get*(): seq[sdl2.Event] = 
    var 
        event = sdl2.defaultEvent
        queue: seq[sdl2.Event]

    while sdl2.pollEvent(event):
        queue.add(event)

    queue

