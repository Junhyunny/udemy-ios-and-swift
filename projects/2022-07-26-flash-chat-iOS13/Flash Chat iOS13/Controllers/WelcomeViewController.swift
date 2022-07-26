//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        titleLabel.text = ""
        var charaterIndex:Double = 0.0
        let titleText = Constants.appName
        for letter in titleText {
            charaterIndex += 0.2
            Timer.scheduledTimer(withTimeInterval: charaterIndex, repeats: false) { timer in
                self.titleLabel.text?.append(letter)
            }
        }
    }
}
