
// this is constans - unmutable and re-assign
let angela = "Angela"
// compile error
//angela = "angela"

// this is also constants - unmutable and re-assign
let constantsArray = [1, 2, 3]
// constantsArray error
//array.remove(at: 0)

print(angela)
print(constantsArray)


// this is variable
var junhyunny = "Junhyunny"
// without compile error
junhyunny = "junhyunny"

// this is variable
var variableArray = [1, 2, 3]
// without compile error
variableArray.remove(at: 0)

print(junhyunny)
print(variableArray)


/*
 Basic Types
 1. String
    - "Junhyunny"
 2. Int(integer)
    - 32. -10, 0
 3. Float(floating point number)
    - 부동 소수점을 사용한다.
 4. Doulbe
    - 부동 소수점 정확도가 float 데이터의 두 배이다.
 5. Bool(Boolean)
    - true, false 값만 가진다.
*/

// range operator(...)
let randomNumber = Int.random(in: 1...3)
print(randomNumber)

// 일반적으로 (...) 연산자만 사용하면 위 아래 범위를 모두 포함된다.
// upper bound를 범위에 포함하고 싶지 않은 경우 ..< 를 사용한다.

print("1...10 contains 10 is \((1...10).contains(10))")
print("1..<10 contains 10 is \((1..<10).contains(10))")
print("10... contains 10 is \((10...).contains(10))")
print("10... contains 5 is \((10...).contains(5))")
print("...10 contains -1 is \((...10).contains(-1))")
print("...10 contains 0 is \((...10).contains(0))")
print("...10 contains 10 is \((...10).contains(10))")
print("...10 contains 11 is \((...10).contains(11))")
