
var numbers: Array<Int> = [45, 73, 195, 53]
var computedNumbers = numbers
                        .map({(number: Int) -> Int in number * 2})
                        .map({(number) in number * 2})

print(numbers)
print(computedNumbers)
