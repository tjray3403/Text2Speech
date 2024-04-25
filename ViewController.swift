//
//  ViewController.swift
//  test2voice
//
//  Created by Tristan Earl Ray, Jr on 4/23/24.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController,  UITextViewDelegate, AVSpeechSynthesizerDelegate {

    @IBOutlet weak var userInput: UITextView!
    let speechSynthesizer = AVSpeechSynthesizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        userInput.delegate = self
        speechSynthesizer.delegate = self
    }
    
    @IBAction func ReadItNow(_ sender: Any) {
        userInput.resignFirstResponder()
        userInput.isEditable = false
        userInput.textColor = .gray
        
        if let content = userInput.text {
            speak(text: content, language: "en")
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        userInput.text = ""
    }
    
    func speechSynthesizer(_ sythesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        userInput.isEditable = true
        userInput.textColor = .black
    }

    func speak(text: String, language: String) {
        let speechUtterance = AVSpeechUtterance(string:text)
        speechUtterance.voice = AVSpeechSynthesisVoice(identifier: "com.app.ttsbungle.Samatha-compact")
        
        speechUtterance.rate = 0.3
        speechSynthesizer.speak(speechUtterance)
    }

}

