import std/[syncio, os]

type TemplParser* = object
    name*: string
    population*: int

proc init*(_: typedesc[TemplParser]): TemplParser =
    TemplParser(name: "DefaultState", population: 0)

proc getConfig(state: TemplParser, path: string): string =
    try:
        let contents = syncio.readFile(path)
        return contents
    except IOError as e:
        return "Config file error: " & e.msg