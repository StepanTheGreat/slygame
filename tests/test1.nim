# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

#import unittest
import slygame, slygame/display, slygame/time

const FPS = 20

var clock = time.newClock()
var screen = display.set_mode((800, 800), "Super window")

var close_on = 0
while true:
    clock.tick(FPS)

    echo close_on
    close_on += 1
    if close_on > 180:
        break

    screen.fill((0, 0, 255, 255))
    screen.flip()

time.delay(1000)
slygame.quit()