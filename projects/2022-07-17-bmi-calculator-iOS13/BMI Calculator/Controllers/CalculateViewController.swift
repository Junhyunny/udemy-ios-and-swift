//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var bmi: BMI?;
    
    func convertToDouble(value: Float) -> Double {
        return Double(String(format: "%.2f", value))!
    }
    
    @IBAction func changeHeight(_ sender: UISlider) {
        bmi!.setHeight(height: convertToDouble(value: sender.value))
        height.text = "\(bmi!.getHeight())m"
    }
    
    @IBAction func changeWeight(_ sender: UISlider) {
        bmi!.setWeight(weight: convertToDouble(value: sender.value))
        weight.text = "\(bmi!.getWeight())kg"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmi = BMI(
            weight: convertToDouble(value: weightSlider.value),
            height: convertToDouble(value: heightSlider.value)
        )
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        print(bmi!.calculateBMI())
        
//        let secondViewController = SecondViewController()
//        secondViewController.bmiValue = String(format: "%.2f", bmi!.calculateBMI())
//        self.present(secondViewController, animated: true, completion: nil)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            // down casting using as keyword
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmi = bmi
        }
    }
}

