//
//  ViewController.swift
//  egg Timer
//
//  Created by Rebecca Wordsworth on 19/09/2016.
//  Copyright © 2016 Rebecca Wordsworth. All rights reserved.
//

import UIKit
import AVFoundation

let kDefaultTimeSoft = 120
let kDefaultTimeMedium = 270
let kDefaultTimeHard = 480


class ViewController: UIViewController {
    
    @IBOutlet weak var imageUpdate: UIImageView!
    @IBOutlet weak var timerOutput: UILabel!
    
  
    var audioPlayer = AVAudioPlayer()
    var timer = Timer()
    var userSelectedTime = kDefaultTimeHard
    var time = kDefaultTimeHard
    
    
    func playFinishSound() {
        let soundName = "alarm"
        let soundType = "caf"
        
        if let soundPath = Bundle.main.path(forResource:soundName, ofType: soundType)
        {
            do
            {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundPath))
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                print("Could not find sound file - playing nothing.")
            }
        }
    }
    
    
    func decreaseTimer() {
        if time > 0 {
            time -= 1
            timerOutput.text = String(time)
        } else {
            timer.invalidate()
        }
        
        if time <= 0 {
            timerOutput.text = "Egg is done!"
            timer.invalidate()
            
            imageUpdate.image = UIImage(named:"egg.jpg")
            playFinishSound()
        }
    }
	
    
    @IBAction func pauseButtonPressed(_ sender: AnyObject) {
        timer.invalidate()
    }
	
	
    @IBAction func playButtonPressed(_ sender: AnyObject) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreaseTimer), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func minusTenButtonPressed(_ sender: AnyObject) {
        time -= 10
        timerOutput.text = String(time)
    }
	

    @IBAction func plusTenButtonPressed(_ sender: AnyObject) {
        time += 10
        timerOutput.text = String(time)
    }
	
        
    @IBAction func resetButtonPressed(_ sender: AnyObject) {
        time = userSelectedTime
        timerOutput.text = String(time)
        timer.invalidate()
        imageUpdate.image = UIImage(named:"image-01-uncooked.jpg")
    }
    
    
    @IBAction func softButtonPressed(_ sender: AnyObject) {
        userSelectedTime = kDefaultTimeSoft
        time = kDefaultTimeSoft
        timerOutput.text = String(time)
    }
    
    
    @IBAction func medButtonPressed(_ sender: AnyObject) {
        userSelectedTime = kDefaultTimeMedium
        time = kDefaultTimeMedium
        timerOutput.text = String(time)
    }
    
    
    @IBAction func hardButtonPressed(_ sender: AnyObject) {
        userSelectedTime = kDefaultTimeHard
        time = kDefaultTimeHard
        timerOutput.text = String(time)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

