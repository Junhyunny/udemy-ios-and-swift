
// inference, infer
var myAge = 12
myAge = 13

//expression failed to parse:
//error: MyPlayground.playground:5:9: error: cannot assign value of type 'String' to type 'Int'
//myAge = "14"
//        ^~~~
//myAge = "14"

print(myAge)

func greeting(name: String) {
    print("hello " + name)
}

greeting(name: "Angela")
greeting(name: "Junhyunny")

func loveCalculator() {
    let randomNumber = Int.random(in: 0...100)
    if randomNumber > 80 {
        print("You love each ohter like Kanye loves Kanye")
    } else if randomNumber > 40 {
        print("You go together like Coke and Mentos")
    } else {
        print("You will be forever alone")
    }
}

func loveCalculatorSwitch() {
    
    let randomNumber = Int.random(in: 0...100)
    
    switch randomNumber {
    case (81..<100):
        print("You love each ohter like Kanye loves Kanye")
    case (41...80):
        print("You go together like Coke and Mentos")
    default:
        print("You will be forever alone")
    }
}

loveCalculator()

loveCalculatorSwitch();
