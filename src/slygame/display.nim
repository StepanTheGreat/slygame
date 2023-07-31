import sdl2

type Window* = object
    window_ptr: WindowPtr
    renderer_ptr: RendererPtr

proc init*() =
    sdl2.init(sdl2.INIT_VIDEO)

proc quit*() =
    sdl2.quitSubSystem(sdl2.INIT_VIDEO)

proc set_mode*(size: (int, int) = (0, 0), caption: string = "Slygame", flags: uint = 0): Window =
    let window = sdl2.createWindow(
        caption, 
        sdl2.SDL_WINDOWPOS_CENTERED, 
        sdl2.SDL_WINDOWPOS_CENTERED,
        size[0].int32,
        size[1].int32,
        flags.uint32
    )
    let renderer = window.createRenderer(0, 0)
    Window(window_ptr: window, renderer_ptr: renderer)

proc flip*(window: var Window) =
    window.renderer_ptr.present()

proc set_caption*(window: var Window, title: string) = 
    window.window_ptr.setTitle(title)

proc set_icon*(window: var Window, surface: sdl2.SurfacePtr) = 
    window.setIcon(surface)

# Draw functions

proc fill*(window: var Window, color: (int, int, int, int)) = 
    window.renderer_ptr.setDrawColor(
        color[0].uint8,
        color[1].uint8,
        color[2].uint8,
        color[3].uint8,
    )
    window.renderer_ptr.clear()