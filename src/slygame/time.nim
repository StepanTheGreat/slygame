import sdl2

type Clock* = object
    frame_time: uint32

proc newClock*(): Clock =
    Clock(frame_time: 0.uint32)

proc tick*(clock: var Clock, fps: uint) = 
    let now = getTicks()
    if clock.frame_time > now:
        delay(clock.frameTime - now)
    clock.frame_time += (1000.float32 / fps.float32).uint32


proc get_ticks*(): uint32 =
    sdl2.getTicks()

proc delay*(milliseconds: uint) =
    sdl2.delay(milliseconds.uint32)