//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var totalBill:TotalBill = TotalBill()
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeBillValue(_ sender: UITextField) {
        totalBill.billValue = Double(sender.text ?? "0") ?? 0.0
    }
    
    func initButtons() {
        zeroButton.isSelected = false
        tenButton.isSelected = false
        twentyButton.isSelected = false
    }
    
    @IBAction func selectTip(_ sender: UIButton) {
        textField.endEditing(true)
        
        initButtons()
        sender.isSelected = true
        
        let strTip = sender.currentTitle?.replacingOccurrences(of: "%", with: "") ?? "10"
        totalBill.tipRateValue = Double(strTip)! / 100.0
    }
    
    @IBAction func changeStepperValue(_ sender: UIStepper) {
        totalBill.peopleCount = Int(sender.value)
        splitLabel.text = String(totalBill.peopleCount)
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        self.performSegue(withIdentifier: "moveToCalculate", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToCalculate" {
            let destination = segue.destination as! CalculateViewController
            destination.totalBill = totalBill
        }
    }
}

