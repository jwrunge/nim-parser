NIM = nim
SRC = src/main.nim
BIN = dist/main

SDL3_DIR = vendor/SDL
SDLGPU_DIR = vendor/SDL_gpu
SDL3_INCLUDE = $(SDL3_DIR)/include
SDL3_LIB = $(SDL3_DIR)/lib
SDLGPU_INCLUDE = $(SDLGPU_DIR)/include
SDLGPU_LIB = $(SDLGPU_DIR)/lib

VENDOR_DEMO_SRC = src/sdl_vendor_demo.nim
VENDOR_DEMO_BIN = dist/sdl_vendor_demo

SDL_VENDOR_CFLAGS = -I$(SDL3_INCLUDE) -I$(SDLGPU_INCLUDE)
SDL_VENDOR_LDFLAGS = -L$(SDL3_LIB) -L$(SDLGPU_LIB) -lSDL3 -lSDL3_gpu -Wl,-rpath,$(CURDIR)/$(SDL3_LIB) -Wl,-rpath,$(CURDIR)/$(SDLGPU_LIB)
SDL_VENDOR_NIM_FLAGS = --passC:"$(SDL_VENDOR_CFLAGS)" --passL:"$(SDL_VENDOR_LDFLAGS)" -d:withSdlGpu

.PHONY: build run clean check-vendor vendor-build vendor-run

build:
	$(NIM) c -o:$(BIN) $(SRC)

run: build
	./$(BIN)

clean:
	rm -f $(BIN)
	rm -f $(VENDOR_DEMO_BIN)

check-vendor:
	@test -d $(SDL3_INCLUDE)/SDL3 || (echo "Missing $(SDL3_INCLUDE)/SDL3" && exit 1)
	@test -d $(SDLGPU_INCLUDE) || (echo "Missing $(SDLGPU_INCLUDE)" && exit 1)
	@test -f $(SDL3_LIB)/libSDL3.dylib || (echo "Missing $(SDL3_LIB)/libSDL3.dylib" && exit 1)
	@test -f $(SDLGPU_LIB)/libSDL3_gpu.dylib || (echo "Missing $(SDLGPU_LIB)/libSDL3_gpu.dylib" && exit 1)

vendor-build: check-vendor
	$(NIM) c -o:$(VENDOR_DEMO_BIN) $(SDL_VENDOR_NIM_FLAGS) $(VENDOR_DEMO_SRC)

vendor-run: vendor-build
	./$(VENDOR_DEMO_BIN)
