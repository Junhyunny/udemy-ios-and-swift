//
//  Bmi.swift
//  BMI Calculator
//
//  Created by JUNHYUN KANG on 2022/07/17.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct BMI {
    
    var weight: Double
    var height: Double
    
    init(weight: Double = 1.5, height: Double = 100) {
        self.weight = weight
        self.height = height
    }
    
    mutating func setWeight(weight: Double) {
        self.weight = weight
    }
    
    mutating func setHeight(height: Double) {
        self.height = height
    }
    
    func getWeight() -> Double {
        return weight
    }
    
    func getHeight() -> Double {
        return height
    }
    
    func calculateBMI() -> Double {
        return self.weight / pow(self.height, 2.0)
    }
    
    func getAdvice() -> String {
        let bmi = calculateBMI()
        if bmi > 20 {
            return "Nice"
        }
        return "Very Good"
    }
    
    func getBackgroundColor() -> UIColor {
        let bmi = calculateBMI()
        if bmi > 20 {
            return UIColor.red
        }
        return UIColor.blue
    }
}
