//
//  CalculateLogic.swift
//  Calculator
//
//  Created by JUNHYUN KANG on 2022/07/31.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

class CalculatorLogic {
    
    private var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        switch symbol {
        case "AC":
            number = 0
        case "+/-":
            number *= -1
        case "%":
            number *= 0.01
        default:
            break
        }
        return number
    }
}
