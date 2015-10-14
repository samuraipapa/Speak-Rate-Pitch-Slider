//
//  ViewController.swift
//  Speak-Rate-Pitch-Slider
//
//  Created by GrownYoda on 10/13/15.
//  Copyright © 2015 yuryg. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {

    
    //  ViewController Class-Wide Variables
    let mySpeechSynth = AVSpeechSynthesizer()
    
    var myRate: Float = 0.50
    var myPitch: Float = 0.99
    var myVolume: Float = 0.50
    
    var langCodeAll38 = [("ar-SA","Arabic","Saudi Arabia"),
    
    ("cs-CZ", "Czech", "Czech Republic"),
    ("da-DK", "Danish","Denmark")
    
    ]
/*
    de-DE       German      Germany
    el-GR       Modern Greek        Greece
    en-AU       English     Australia
    en-GB       English     United Kingdom
    en-IE       English     Ireland
    en-US       English     United States
    en-ZA       English     South Africa
    es-ES       Spanish     Spain
    es-MX       Spanish     Mexico
    fi-FI       Finnish     Finland
    fr-CA       French      Canada
    fr-FR       French      France
    he-IL       Hebrew      Israel
    hi-IN       Hindi       India
    hu-HU       Hungarian       Hungary
    id-ID       Indonesian      Indonesia
    it-IT       Italian     Italy
    ja-JP       Japanese        Japan
    ko-KR       Korean      Republic of Korea
    nl-BE       Dutch       Belgium
    nl-NL       Dutch       Netherlands
    no-NO       Norwegian       Norway
    pl-PL       Polish      Poland
    pt-BR       Portuguese      Brazil
    pt-PT       Portuguese      Portugal
    ro-RO       Romanian        Romania
    ru-RU       Russian     Russian Federation
    sk-SK       Slovak      Slovakia
    sv-SE       Swedish     Sweden
    th-TH       Thai        Thailand
    tr-TR       Turkish     Turkey
    zh-CN       Chinese     China
    zh-HK       Chinese     Hong Kong
    zh-TW       Chinese     Taiwan
*/

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
        myUtterance.pitchMultiplier = myPitch
        myUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        mySpeechSynth.speakUtterance(myUtterance)
  
        
    }
    
    //MARK - UIPickerView Methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return langCodeAll38.count
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let myString = "\(langCodeAll38[row].1) of \(langCodeAll38[row].2)"
        
        return myString
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

