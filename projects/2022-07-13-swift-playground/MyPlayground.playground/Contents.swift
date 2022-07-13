
func greeting() {
    for _ in 1...4 {
        print("hello")
    }
}

greeting()


func greeting1() {
    let myName = "Junhyunny"
    
    print("hi")
    
    func greeting2() {
        print("hey " + myName)
    }
    
    greeting2()
}

greeting1()

struct Position {
    var x: Int
    var y: Int
    
    init(_ x:Int, _ y: Int) {
        self.x = x
        self.y = y
    }
    
    mutating func up() {
        self.y = y - 1
    }
    
    mutating func down() {
        self.y = y + 1
    }
    
    mutating func left() {
        self.x = x - 1
    }
    
    mutating func right() {
        self.x = x + 1
    }
}

var fox: Position = Position(0, 0)
var corn: Position = Position(5, 5)

var map = [
    ["🦊", "⬜️", "⬜️", "⬜️", "⬜️", "⬜️", "⬜️"],
    ["⬜️", "⬜️", "⬜️", "⬜️", "⬜️", "⬜️", "⬜️"],
    ["⬜️", "⬜️", "⬜️", "⬜️", "⬜️", "⬜️", "⬜️"],
    ["⬜️", "⬜️", "⬜️", "⬜️", "⬜️", "⬜️", "⬜️"],
    ["⬜️", "⬜️", "⬜️", "⬜️", "⬜️", "⬜️", "⬜️"],
    ["⬜️", "⬜️", "⬜️", "⬜️", "🌽", "⬜️", "⬜️"],
    ["⬜️", "⬜️", "⬜️", "⬜️", "⬜️", "⬜️", "⬜️"]
]

func swap(_ curX:Int, _ curY: Int, _ nextX:Int, _ nextY:Int) {
    let fox = map[curY][curX]
    let emptySpace = map[nextX][nextY]
    map[nextY][nextX] = fox
    map[curY][curX] = emptySpace
}

func down() {
    let curX = fox.x
    let curY = fox.y
    fox.down()
    swap(curX, curY, fox.x, fox.y)
}

func right() {
    let curX = fox.x
    let curY = fox.y
    fox.right()
    swap(curX, curY, fox.x, fox.y)
}

func moveToCorn() {
    printMap(map)
    
    down()
    down()
    down()
    down()
    down()
    right()
    right()
    right()
    right()
    
    printMap(map)
}

func printMap(_ map: Array<Any>) {
    print("")
    for index in 0 ... 6 {
        print(map[index])
    }
}

moveToCorn()
