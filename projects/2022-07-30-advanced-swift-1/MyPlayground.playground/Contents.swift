
var pizzaInInches: Int = 14

// computed property
var numberOfSlices: Int {
    get {
        return pizzaInInches - 4
    }
    set {
        print("numberOfSlice now has a new value which is \(newValue)")
    }
    // return pizzaInInches - 4
}

print("numberOfSlices-1 \(numberOfSlices)")

pizzaInInches = 10

print("numberOfSlices-2 after change to set pizzaInInches \(numberOfSlices)")

numberOfSlices = 12

print("numberOfSlices-3 \(numberOfSlices)")

var numberOfPeople = 6
let slicesPerPerson = 5

print("numberOfPeople \(numberOfPeople)")

var numberOfPizza: Int {
    get {
        // 6 / 5 = 1
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        // 6 / 1 = 6
        return numberOfPeople / numberOfPeopleFedPerPizza
    }
    set {
        // 6 * 4 = 24
        let totalSlices = numberOfSlices * newValue
        // 24 / 5 = 4
        numberOfPeople = totalSlices / slicesPerPerson
    }
}

// 6
print("numberOfPizza \(numberOfPizza)")

// 4
numberOfPizza = 4

print("numberOfPeople \(numberOfPeople)")


var temp: Int = 10 {
    willSet {
        print(temp)
        print(newValue)
    }
    didSet {
        print(temp)
        print(oldValue)
        if temp >= 10 {
            print("temp set to 10")
            temp = 10
        }
    }
}

temp = 12
print(temp)
