NIM = nim
SRC = src/main.nim
BIN = dist/main

.PHONY: build run clean

build:
	$(NIM) c -o:$(BIN) $(SRC)

run: build
	./$(BIN)

clean:
	rm -f $(BIN)
