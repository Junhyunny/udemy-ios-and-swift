
var a = 3

print(a)

a = 5

print(a)

let b = 5
//b = 7, error occur

print(b)

var stringVal: String = "1234"

print(stringVal)

var integerVal: Int = 1234

print(integerVal)

var floatVal: Float = 1.2313

print(floatVal)

var booleanVal: Bool = true

print(booleanVal)


// range operator, ...
print(Int.random(in: 1...5))
print(Float.random(in: 1..<5))

let array = [1, 2, 3, 5, 7, 8, 12]
print(array.randomElement() as Any)
print(array.shuffled())

func getRandom(_ alphabet: [String]) -> String {
    var result = ""
    for _ in 1...6 {
        result = result + alphabet.randomElement()!
    }
    return result
}

func exercise() {
    
    let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
    //The number of letters in alphabet equals 26
    let password = getRandom(alphabet) // Replace this comment with your code.
    
    print(password)
}

exercise()
