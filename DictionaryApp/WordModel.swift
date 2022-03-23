//
//  WordModel.swift
//  DictionaryApp
//
//  Created by Минтимер Харасов on 22.03.2022.
//

import Foundation

struct Word {
    var word: String
    var translation: String
    var transcription: String
    var example: Array<String>
    
    var remembered: Bool = false
    var toBeRevised: Bool = false
    
    mutating func needToRemember() {
        remembered = true
        toBeRevised = false
    }
    
    mutating func needToRevise() {
        toBeRevised = true
        remembered = false
    }
}

enum Language: String {
    case Ru = "Ru"
    case En = "En"
}
