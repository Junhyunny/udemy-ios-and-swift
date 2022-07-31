//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let currentDisplayValue = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label ttext to a double")
            }
            return currentDisplayValue
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
                
        if let calcMethod = sender.currentTitle {
            let calculator = CalculatorLogic(number: displayValue)
            guard let result = calculator.calculate(symbol: calcMethod) else {
                fatalError("Cannot operate")
            }
            displayValue = result
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let number = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = number
                isFinishedTypingNumber = false
            } else {
                if number == "." {
                    if floor(displayValue) != displayValue {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + number
            }
        }
    }
}

