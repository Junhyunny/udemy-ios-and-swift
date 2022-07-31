//
//  CalculateLogic.swift
//  Calculator
//
//  Created by JUNHYUN KANG on 2022/07/31.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (number1: Double, calcMethod: String)?
    
    private var calculatedValue: Double? {
        get {
            if let number1 = intermediateCalculation?.number1,
               let method = intermediateCalculation?.calcMethod,
               let number2 = number {
                switch method {
                case "+":
                    return number1 + number2
                case "-":
                    return number1 - number2
                case "×":
                    return number1 * number2
                case "÷":
                    return number1 / number2
                default:
                    break
                }
            }
            return nil
        }
    }
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "AC":
                return 0
            case "+/-":
                return n * -1
            case "%":
                return n * 0.01
            case "=":
                return self.calculatedValue
            default:
                self.intermediateCalculation = (number1: n, calcMethod: symbol)
                return n
            }
        }
        return nil
    }
}
