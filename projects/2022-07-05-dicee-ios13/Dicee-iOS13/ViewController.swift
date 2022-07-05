//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstDice: UIImageView!
    @IBOutlet weak var secondDice: UIImageView!
    @IBOutlet weak var thirdDice: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        firstDice.image = UIImage(imageLiteralResourceName: "DiceOne")
        secondDice.image = UIImage(imageLiteralResourceName: "DiceTwo")
        thirdDice.image = UIImage(imageLiteralResourceName: "DiceThree")
        
    }
    
    @IBAction func rollButtonPressed(_ sender: Any) {
        print("Hello World")
        
        firstDice.image = UIImage(imageLiteralResourceName: getRandomDice(Int.random(in: 1...6)))
        secondDice.image = UIImage(imageLiteralResourceName: getRandomDice(Int.random(in: 1...6)))
        thirdDice.image = UIImage(imageLiteralResourceName: getRandomDice(Int.random(in: 1...6)))
    }
    
    func getRandomDice(_ number: Int) -> String {
        var result = "DiceOne"
        switch number {
        case 1:
            result = "DiceOne"
        case 2:
            result = "DiceTwo"
        case 3:
            result =  "DiceThree"
        case 4:
            result =  "DiceFour"
        case 5:
            result =  "DiceFive"
        case 6:
            result =  "DiceSix"
        default:
            result = "DiceOne"
        }
        return result
    }
    
}
