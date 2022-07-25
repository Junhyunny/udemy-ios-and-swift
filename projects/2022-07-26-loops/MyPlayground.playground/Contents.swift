import Foundation

let fruits = ["Apple", "Pear", "Orange"]
let contacts = ["Adam": 123456789, "James": 987654321, "Amy": 912345321]
let word = "supercalifragilisticexpialidocious"
let halfOpenRange = 1..<5
let closedRange = 1...5

for fruit in fruits {
    print(fruit)
}

for contact in contacts {
    print(contact)
    print(contact.key)
    print(contact.value)
}

for letter in word {
    print(letter)
}

for index in halfOpenRange {
    print("halfOpenRange \(index)")
}

for index in closedRange {
    print("closedRange \(index)")
}

var now = Date().timeIntervalSince1970
let oneSecondFromNow = now + 1

while now < oneSecondFromNow {
    now = Date().timeIntervalSince1970
    print("waiting...")
}
