import unittest

import slygame, slygame/display, slygame/time, slygame/events

test "Game loop":
    var screen = (800, 800).set_mode("Pygame 3")
    var clock = time.newClock()
    var run = true

    while run:
        clock.tick 60
        for event in get():
            if event.kind == events.QUIT:
                run = false
        
        screen.fill (0, 255, 0, 255)
        screen.flip

    slygame.quit()
    check true
    