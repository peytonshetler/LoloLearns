//
//  Animal.swift
//  LoloLearns
//
//  Created by Peyton Shetler on 6/15/22.
//

import Foundation

enum Animal: String, CaseIterable, FlashCardItem {
    case sheep
    case racoon
    case goat
    case mouse
    case cow
    case chicken
    case duck
    case bee
    case ladybug
    case butterfly
    case monkey
    case gorilla
    case owl
    case turtle
    case crab
    case fish
    case whale
    case dolphin
    case shark
    case tiger
    case zebra
    case elephant
    case hippo
    case rhino
    case camel
    case giraffe
    case horse
    case pig
    case deer
    case dog
    case flamingo
    case rabbit
    
    var name: String {
        return self.rawValue
    }
    
    var cardType: FlashCardType {
        return .animal
    }
    
    var symbol: String {
        switch self {
        // Animals
        case .racoon: return "🦝"
        case .sheep: return "🐑"
        case .goat: return "🐐"
        case .mouse: return "🐁"
        case .cow: return "🐄"
        case .chicken: return "🐓"
        case .duck: return "🦆"
        case .bee: return "🐝"
        case .ladybug: return "🐞"
        case .butterfly: return "🦋"
        case .monkey: return "🐒"
        case .gorilla: return "🦍"
        case .owl: return "🦉"
        case .turtle: return "🐢"
        case .crab: return "🦀"
        case .fish: return "🐠"
        case .whale: return "🐳"
        case .dolphin: return "🐬"
        case .shark: return "🦈"
        case .tiger: return "🐅"
        case .zebra: return "🦓"
        case .elephant: return "🐘"
        case .hippo: return "🦛"
        case .rhino: return "🦏"
        case .camel: return "🐪"
        case .giraffe: return "🦒"
        case .horse: return "🐎"
        case .pig: return "🐖"
        case .deer: return "🦌"
        case .dog: return "🐕"
        case .flamingo: return "🦩"
        case .rabbit: return "🐇"
        }
    }
}
