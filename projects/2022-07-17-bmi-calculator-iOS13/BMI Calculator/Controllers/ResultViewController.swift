//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by JUNHYUN KANG on 2022/07/17.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var bmi: BMI?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var resultBackground: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = String(format: "%0.2f", bmi!.calculateBMI())
        adviceLabel.text = bmi!.getAdvice()
        resultBackground.backgroundColor = bmi!.getBackgroundColor()
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
