//
//  ViewController.swift
//  Speak-Rate-Pitch-Slider
//
//  Created by GrownYoda on 10/13/15.
//  Copyright © 2015 yuryg. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //  ViewController Class-Wide Variables
    let mySpeechSynth = AVSpeechSynthesizer()
    
    var myRate: Float = 0.50
    var myPitch: Float = 0.99
    var myVolume: Float = 0.50
    
    // UI Elements [Outlets]

    @IBOutlet weak var rateNumLabel: UILabel!
    @IBOutlet weak var pitchNumLabel: UILabel!
    @IBOutlet weak var volumeNumLabel: UILabel!
    
    
    // UI Elements [Action]
    
    @IBAction func rateSliderMoved(sender: UISlider) {
        rateNumLabel.text =  String(sender.value)
        myRate = sender.value
    }
    
    @IBAction func pitchSliderMoved(sender: UISlider) {
        pitchNumLabel.text = String(sender.value)
        myPitch = sender.value
    }
    
    @IBAction func volumeSliderMoved(sender: UISlider) {
        volumeNumLabel.text = String(sender.value)
        myVolume = sender.value
    }
    
    @IBAction func speakButtonPressed(sender: UIButton) {
    
        let myUtterance = AVSpeechUtterance(string: "English")
        myUtterance.rate = myRate
        myUtterance.pitchMultiplier = Float(myPitch)
        myUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        mySpeechSynth.speakUtterance(myUtterance)
  
        
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

