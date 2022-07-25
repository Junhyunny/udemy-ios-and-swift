
func calculator(n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

func add(no1: Int, no2: Int) -> Int {
    return no1 + no2
}

func substract(no1: Int, no2: Int) -> Int {
    return no1 - no2
}

func multiply(no1: Int, no2: Int) -> Int {
    return no1 * no2
}

calculator(n1: 2, n2: 3, operation: add)

calculator(n1: 2, n2: 3, operation: substract)

calculator(n1: 3, n2: 3, operation: multiply(no1:no2:))

calculator(n1: 3, n2: 3, operation: {(no1: Int, no2: Int) -> Int in
    return no1 * no2
})

// input closure type 추론 발생
calculator(n1: 3, n2: 3, operation: {(no1, no2) -> Int in
    return no1 * no2
})

// output closure type 추론 발생
calculator(n1: 3, n2: 3, operation: {(no1, no2) in
    return no1 * no2
})

// return을 별도로 하지 않아도 된다.
calculator(n1: 3, n2: 3, operation: {(no1, no2) in no1 * no2})

// first and second parameter
// $0, $1
let result = calculator(n1: 3, n2: 3, operation: {$0 * $1})
print(result)

// first and second parameter
// $0, $1
let result2 = calculator(n1: 12, n2: 3) {$0 * $1}
print(result2)

let array = [6, 2, 3, 9, 4, 1]

func addOne (n1: Int) -> Int {
    return n1 + 1
}

print(array.map(addOne))

print(array.map({(n1: Int) -> Int in return n1 + 1}))

print(array.map({(n1: Int) -> Int in n1 + 1}))

print(array.map({(n1) in n1 + 1}))

print(array.map({$0 + 1}))

print(array.map(){$0 + 1})

print(array.map{$0 + 1})

let newArray = array.map{"\($0)"}
print(newArray)
