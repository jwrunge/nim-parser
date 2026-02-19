import std/[syncio, os]
from types/Person import Person

var child: Person
var adult: Person

child = Person(name: "Alice", age: 10)
adult.name = "Bob"
adult.age = 30

echo "Child: ", child.name, ", Age: ", child.age
echo "Adult: ", adult.name, ", Age: ", adult.age