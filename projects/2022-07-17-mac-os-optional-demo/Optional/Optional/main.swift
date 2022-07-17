

struct MyOptional {
    var property = 123
    
    func method() {
        print("I'm MyOptional method")
    }
}

let myOptional: String?

myOptional = Int.random(in: 1...2) % 2 == 0 ? "Angela" : nil

// force unwrapping
// error when force unwrapping the nil object
//let text1: String = myOptional!
//print(text1)

// check nil
if myOptional != nil {
    let text2: String = myOptional!
    print(text2)
} else {
    print("myOptional was found to be nil")
}

// nil caoalescing operator
let text3: String = myOptional ?? "HelloWorld"
print(text3)

// optional chaining
var myOptionalStruct: MyOptional? = nil
let number: Int? = myOptionalStruct?.property
print(number)
myOptionalStruct?.method()

//let text2: String = myOptional?.lowercased()
//print(text2)
