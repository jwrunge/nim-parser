import ffi/sdl3

when defined(withSdlGpu):
  import ffi/sdl3_gpu

proc run*() =
  if SDL_Init(SDL_INIT_VIDEO) != 0:
    quit "SDL_Init failed: " & $SDL_GetError()

  echo "SDL3 initialized using vendored headers/libs."

  when defined(withSdlGpu):
    var gpuDevicePtr: ptr SDL_GPUDevice
    discard gpuDevicePtr
    echo "SDL_gpu module imported."

  SDL_Quit()

when isMainModule:
  run()