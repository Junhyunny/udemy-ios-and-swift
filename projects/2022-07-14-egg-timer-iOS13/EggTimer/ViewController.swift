//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var globalTimer: Timer?
    var player: AVAudioPlayer?
    let eggTimes: [String:Float] = [
        "Soft": 3,
        "Medium": 5,
        "Hard": 7
    ]
    let minute:Float = 5
    
    @IBAction func clickEgg(_ sender: UIButton) {

        if globalTimer != nil {
            globalTimer?.invalidate()
        }
            
        titleLabel.text = "How do you like your eggs?"
        progressBar.progress = 0
        
        let hardness = sender.currentTitle
        let totalSeconds = eggTimes[hardness!]! * minute
        var seconds:Float = 0
        
        globalTimer = Timer.scheduledTimer (
            withTimeInterval: 1.0, repeats: true
        ) {
            timer in
            seconds = seconds + 1;
            self.progressBar.progress = seconds / totalSeconds
            if seconds == totalSeconds {
                timer.invalidate()
                self.globalTimer = nil
                self.titleLabel.text = "DONE!"
                self.playFinishAlarm()
            }
        }
    }
    
    func playFinishAlarm () {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
    }
}
