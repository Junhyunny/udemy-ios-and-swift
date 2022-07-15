
//var playerName1: String = nil

var playerName1: String? = nil
playerName1 = "Junhyunny"

var unwrappedPlayerName1 = playerName1!

print (playerName1)
print (playerName1!)

// nil 객체를 ! 연산자를 이용해 강제로 꺼내는 경우 에러가 발생한다.
playerName1 = nil
print (playerName1!)
