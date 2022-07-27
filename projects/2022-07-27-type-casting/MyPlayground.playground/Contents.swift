
import Foundation

class Animal {
    var name: String
    
    init(n: String) {
        name = n
    }
    
    func eat() {
        print("eat food")
    }
}

class Human: Animal {
    func code() {
        print("Typing away...")
    }
}

class Fish: Animal {
    func breathUnderWater() {
        print("Breathing under water")
    }
}

let angela = Human(n: "Angela Yu")
let jack = Human(n: "Jack Bauer")
let nemo = Fish(n: "Nemo")

let neighbours = [angela, jack, nemo]

let first = neighbours[0]

// instanceof, type checking
if first is Human {
    print("First Neighbor is a Human")
}

let firstHuman = first as! Human
firstHuman.code()

// up cast
let angelaAsAnimal = angela as Animal
angelaAsAnimal.eat()

func findNemo(from animals: [Animal]) {
    for animal in animals {
        if animal is Fish {
            print(animal.name)
            // forced down cast
            (animal as! Fish).breathUnderWater()
        }
    }
}
findNemo(from: neighbours)

// safe way to type down cast
print("hello")
let fish = first as? Fish
print(fish)
fish?.breathUnderWater()
print("world")
