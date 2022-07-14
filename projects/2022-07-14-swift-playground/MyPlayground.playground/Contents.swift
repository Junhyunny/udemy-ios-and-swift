
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

