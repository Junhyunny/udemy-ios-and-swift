//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        if quizBrain.isRightAnswer(sender.currentTitle!) {
            quizBrain.increaseScore()
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.increaseQuestionNumber()
        
        Timer.scheduledTimer(
            withTimeInterval: 0.25,
            repeats: false,
            block: {
                timer in
                self.updateUI()
            })
    }
    
    func updateUI() {
        questionLabel.text = quizBrain.getQuestion()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        aButton.setTitle(quizBrain.getAnswer(at: 0), for: UIControl.State.normal)
        bButton.setTitle(quizBrain.getAnswer(at: 1), for: UIControl.State.normal)
        cButton.setTitle(quizBrain.getAnswer(at: 2), for: UIControl.State.normal)
        
        aButton.backgroundColor = UIColor.clear
        bButton.backgroundColor = UIColor.clear
        cButton.backgroundColor = UIColor.clear
    }
}

