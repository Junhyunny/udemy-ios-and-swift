
var numbers = [3, 1, 4, 2]
var multiplies = [1, 4, 2, 3]

var computedNubmers = numbers.enumerated().map{ (index, number) in
    number * multiplies[index]
}

print(computedNubmers)
