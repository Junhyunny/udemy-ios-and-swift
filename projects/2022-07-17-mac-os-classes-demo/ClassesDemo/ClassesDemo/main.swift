
var skeleton: Enermy = Enermy()

print(skeleton.health)
skeleton.move()
skeleton.attack()


var secondSkeleton: Enermy = Enermy()

print(secondSkeleton.health)
secondSkeleton.move()
secondSkeleton.attack()


var thirdSkeleton: Enermy = skeleton

skeleton.takeDamage(amount: 10)

print("skeleton: \(skeleton.health)")
print("thirdSkeleton: \(thirdSkeleton.health)")


var dragon: Dragon = Dragon()

print(dragon.health)
dragon.move()
dragon.attack()
dragon.talk(speech: "My teeth are swords! My claws are spears! My wings are a hurricane")


var monster1: StructEnermy = StructEnermy(health: 100, attackStrength: 10)
monster1.takeDamage(amount: 10)
print("monster1: \(monster1.health)")


// 깎인 값으로 객체 복사
var monster2: StructEnermy = monster1
monster1.takeDamage(amount: 10)
monster2.takeDamage(amount: 20)

print("monster1: \(monster1.health)")
print("monster2: \(monster2.health)")

