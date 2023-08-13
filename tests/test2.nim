import slygame, slygame/display, slygame/time, slygame/events


var screen = display.set_mode("Testing", (800, 800))
var clock = time.clock()
var run = true

var pos = [0, 0]

while run:
    clock.tick 60
    for event in get():
        if event.kind == events.QUIT:
            run = false
    
    screen.fill(0x00FF0000)

    screen.draw_rect(0xFF, (pos[0], pos[1], 50, 50))
    screen.flip()

slygame.quit()
    