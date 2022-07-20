import Security

class Bird: Flyable {
    
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("The bird makes a new bird in a shell")
        }
    }
    
    func fly() {
        print("The bird flaps its wings and lifts off into the sky")
    }
}

class Eagle: Bird {
    
    func soar() {
        print("The eagle glides in the air using air currents")
    }
}

class Penguin: Bird {
    
    func swip() {
        print("The penguin paddels through the warter")
    }
}

struct FlyingMuseum {
    
    func flyingDemo(flyingObject: Flyable) {
        flyingObject.fly()
    }
}

protocol Flyable {
    
    func fly()
}

struct Airplane: Flyable {
    
    func fly() {
        print("Airplane Fly")
    }
}


let eagle: Eagle = Eagle()
eagle.fly()
eagle.layEgg()
eagle.soar()

let penguin = Penguin()
penguin.fly()
penguin.layEgg()
penguin.swip()


let flyingMuseum = FlyingMuseum()
flyingMuseum.flyingDemo(flyingObject: eagle)
flyingMuseum.flyingDemo(flyingObject: penguin)
flyingMuseum.flyingDemo(flyingObject: Airplane())
