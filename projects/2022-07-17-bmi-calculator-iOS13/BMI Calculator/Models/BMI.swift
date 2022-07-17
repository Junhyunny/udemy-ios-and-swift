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
    
    var bmiValue: Double
    var color: UIColor
    var advice: String
    
    init(weight: Double = 1.5, height: Double = 100) {
        self.weight = weight
        self.height = height
        self.bmiValue = 0.0
        self.color = UIColor.blue
        self.advice = "Normal"
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
    
    mutating func calculateBMI() {
        bmiValue = weight / pow(height, 2.0)
        if bmiValue >= 25 {
            advice = "Overweight"
            color = UIColor.orange
        } else if bmiValue >= 18.5 && bmiValue < 25 {
            advice = "Normal"
            color = UIColor.blue
        } else {
            advice = "Underweight"
            color = UIColor.purple
        }
    }
}
