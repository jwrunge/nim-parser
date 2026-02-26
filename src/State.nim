import std/[syncio, os]

type State* = object
    name*: string
    population*: int

proc init*(_: typedesc[State]): State =
    State(name: "DefaultState", population: 0)

proc getConfig(state: State, path: string): string =
    try:
        let contents = syncio.readFile(path)
        return contents
    except Error as e:
        return "Config file error: " & e.msg