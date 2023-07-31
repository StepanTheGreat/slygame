import sdl2

type Clock* = object
    fps: uint32
    frame_time: uint32

proc newClock*(fps: uint): Clock =
    Clock(fps: fps.uint32, frame_time: 0.uint32)

proc tick*(clock: var Clock) = 
    let now = getTicks()
    if clock.frame_time > now:
        delay(clock.frameTime - now)
    clock.frame_time += clock.fps


proc get_ticks*(): uint32 =
    sdl2.getTicks()

proc delay*(milliseconds: uint) =
    sdl2.delay(milliseconds.uint32)