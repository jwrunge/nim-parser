import std/[syncio, os]

type State* = object
    name*: string
    population*: int

proc init*(_: typedesc[State]): State =
    State(name: "DefaultState", population: 0)