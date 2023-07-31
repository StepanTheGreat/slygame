import unittest
import slygame, slygame/display, slygame/time

# The test should just open a window, and close it with no errors.

test "Window init":
    var screen = display.set_mode((800, 800), "Test window")

    screen.fill((0, 0, 255, 255))
    screen.flip()

    time.delay(1000)

    slygame.quit()
    check true
    