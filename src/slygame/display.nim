import sdl2
import utils

type Window* = object 
    windowPtr:  sdl2.WindowPtr
    rendererPtr: sdl2.RendererPtr

proc init*() =
    sdl2.init(sdl2.INIT_VIDEO)

proc is_init*(): bool =
    bool(sdl2.wasInit(INIT_VIDEO) and INIT_VIDEO)

proc quit*() =
    sdl2.quitSubSystem(sdl2.INIT_VIDEO)

proc set_mode*(caption: string, size: (int, int) = (0, 0), flags: uint = 0): Window =
    if not is_init():
        init()

    let window = sdl2.createWindow(
        caption, 
        sdl2.SDL_WINDOWPOS_CENTERED, 
        sdl2.SDL_WINDOWPOS_CENTERED,
        size[0].int32,
        size[1].int32,
        flags.uint32
    )
    let renderer = window.createRenderer(0, 0)

    Window(
        windowPtr: window,
        rendererPtr: renderer
    )

proc flip*(window: var Window) =
    window.rendererPtr.present()

proc set_caption*(window: var Window, title: string) = 
    window.windowPtr.setTitle(title)

proc set_icon*(window: var Window, surface: sdl2.SurfacePtr) = 
    window.windowPtr.setIcon(surface)

# Draw functions

proc fill*(window: var Window, color: uint32) =
    window.rendererPtr.setDrawColor(
        utils.extractRGB(color)
    )
    window.rendererPtr.clear()

proc draw_rect*(window: var Window, color: uint32, rect: (int, int, int, int)) = 
    let r = sdl2.rect(rect[0].cint, rect[1].cint, rect[2].cint, rect[3].cint)

    window.rendererPtr.setDrawColor(
        utils.extractRGB(color)
    )
    window.rendererPtr.drawRect(unsafeAddr r)