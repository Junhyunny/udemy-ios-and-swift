import UIKit
import Darwin

let tuple = ("Angela1", 12)

print(tuple.0)
print(tuple.1)

let tuple2 = (name: "Angela2", age: 12)

print(tuple2.name)
print(tuple2.age)

var tuple3: (name: String, age: Int)
tuple3.name = "Angela3"
tuple3.age = 12

print(tuple3.name)
print(tuple3.age)

tuple3 = (name: "Junhyunny", age: 32)

print(tuple3.name)
print(tuple3.age)
