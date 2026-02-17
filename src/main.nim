from types/Person import Person
from ffi/sdl3 import SDL_Init, SDL_Quit, SDL_GetError, SDL_INIT_VIDEO

var child: Person
var adult: Person

child = Person(name: "Alice", age: 10)
adult.name = "Bob"
adult.age = 30

echo "Child: ", child.name, ", Age: ", child.age
echo "Adult: ", adult.name, ", Age: ", adult.age

