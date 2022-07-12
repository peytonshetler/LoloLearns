//
//  VoiceManager.swift
//  LoloLearns
//
//  Created by Peyton Shetler on 6/15/22.
//

import Foundation
import AVFoundation

enum LanguageCode: String {
    case english = "en-US"
}

struct VoiceManager {
     private let synthesizer = AVSpeechSynthesizer()
    
    func speak(word: String) {
        guard !synthesizer.isSpeaking else { return }
        
        let utterance = AVSpeechUtterance(string: word)
        utterance.rate = 0.44
        utterance.voice = AVSpeechSynthesisVoice(language: LanguageCode.english.rawValue)
        
        synthesizer.speak(utterance)
    }
}
