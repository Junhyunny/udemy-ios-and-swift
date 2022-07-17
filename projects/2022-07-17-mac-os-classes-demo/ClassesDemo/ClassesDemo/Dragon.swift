
class Dragon: Enermy {
    
    var windSpan = 3
    
    override func move() {
        print("fly the sky")
    }
    
    override func attack() {
        super.attack()
        print("Spits fire, does \(attackStrength) damage")
    }
        
    func talk(speech: String) {
        print("Says: \(speech)")
    }
}
