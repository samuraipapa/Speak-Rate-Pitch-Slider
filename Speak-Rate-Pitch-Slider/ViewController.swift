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
    
    var currentLang = ("en-US",       "English",     "United States","🇺🇸")
    
    // from :http://www.geonames.de/languages.html , http://www.omniglot.com/language/names.htm , http://wpcentral.io/internationalization/
    // current lang array has known typos, to fix in future.
    var langCodeAll38 = [
    ("en-US",  "English", "United States", "American English","🇺🇸"),
    ("ar-SA","Arabic","Saudi Arabia","العربية","🇸🇦"),
    ("cs-CZ", "Czech", "Czech Republic","český","🇨🇿"),
    ("da-DK", "Danish","Denmark","Dansk","🇩🇰"),
    
    
    
    ("de-DE",       "German", "Germany", "Deutsche","🇩🇪"),
    ("el-GR",      "Modern Greek",        "Greece","ελληνική","🇬🇷"),
    ("en-AU",     "English",     "Australia","Aussie","🇦🇺"),
    ("en-GB",     "English",     "United Kingdom", "Queen's English","🇬🇧"),
    ("en-IE",      "English",     "Ireland", "Gaeilge","🇮🇪"),
    ("en-ZA",       "English",     "South Africa", "South African English","🇿🇦"),
    ("es-ES",       "Spanish",     "Spain", "Español","🇪🇸"),
    ("es-MX",       "Spanish",     "Mexico", "Español de México","🇲🇽"),
    ("fi-FI",       "Finnish",     "Finland","Suomi","🇫🇮"),
    ("fr-CA",       "French",      "Canada","Français du Canada","🇨🇦" ),
    ("fr-FR",       "French",      "France", "Français"),
    ("he-IL",       "Hebrew",      "Israel","עברית"),
    ("hi-IN",       "Hindi",       "India", "हिन्दी"),
    ("hu-HU",       "Hungarian",    "Hungary", "Magyar"),
    ("id-ID",       "Indonesian",    "Indonesia","Bahasa Indonesia"),
    ("it-IT",       "Italian",     "Italy", "Italiano"),
    ("ja-JP",       "Japanese",     "Japan", "日本語"),
    ("ko-KR",       "Korean",      "Republic of Korea", "한국어"),
    ("nl-BE",       "Dutch",       "Belgium","Nederlandse"),
    ("nl-NL",       "Dutch",       "Netherlands", "Nederlands"),
    ("no-NO",       "Norwegian",    "Norway", "Norsk"),
    ("pl-PL",       "Polish",      "Poland", "Polski"),
    ("pt-BR",       "Portuguese",      "Brazil","Portuguese"),
    ("pt-PT",       "Portuguese",      "Portugal","Portuguese"),
    ("ro-RO",       "Romanian",        "Romania","Română"),
    ("ru-RU",       "Russian",     "Russian Federation","русский"),
    ("sk-SK",       "Slovak",      "Slovakia", "Slovenčina "),
    ("sv-SE",       "Swedish",     "Sweden","Svenska"),
    ("th-TH",       "Thai",        "Thailand","ภาษาไทย"),
    ("tr-TR",       "Turkish",     "Turkey","Türkçe"),
    ("zh-CN",       "Chinese",     "China","漢語/汉语"),
    ("zh-HK",       "Chinese",   "Hong Kong","漢語/汉语","🇳🇴"),
    ("zh-TW",       "Chinese",     "Taiwan","漢語/汉语")
                    ]


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
    
        let myUtterance = AVSpeechUtterance(string: currentLang.3)
        myUtterance.rate = myRate
        myUtterance.pitchMultiplier = myPitch
        myUtterance.voice = AVSpeechSynthesisVoice(language: currentLang.0)
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
        
        let myString = "\(langCodeAll38[row].3)"
        
        return myString
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentLang = langCodeAll38[row]
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

