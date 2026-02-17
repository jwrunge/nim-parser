proc SDL_Init*(flags: uint32): cint {.importc: "SDL_Init", cdecl, header: "<SDL3/SDL.h>".}
proc SDL_Quit*() {.importc: "SDL_Quit", cdecl, header: "<SDL3/SDL.h>".}
proc SDL_GetError*(): cstring {.importc: "SDL_GetError", cdecl, header: "<SDL3/SDL.h>".}

const SDL_INIT_VIDEO* = 0x00000020'u32