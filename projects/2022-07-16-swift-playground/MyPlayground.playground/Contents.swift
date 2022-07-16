struct Town {
    let name: String
    var citizens: [String]
    var resources: [String : Int]
    
    init(name: String, citizens: [String], resources: [String : Int]) {
        self.name = name
        self.citizens = citizens
        self.resources = resources
    }
    
    func fortify() {
        print("Defences increased!")
    }
}

var town = Town(
    name: "Junhyunny Land",
    citizens: [
        "Junhyunny",
        "Jack",
        "Angela"
    ],
    resources:  [
        "Grain": 100,
        "Ore": 42,
        "Wool": 75
    ]
)

print(town.citizens)
print("\(town.name) has \(town.resources["Grain"]!) bags of grain.")

town.citizens.append("Keanu Reeves")
print(town.citizens)

town.fortify()
