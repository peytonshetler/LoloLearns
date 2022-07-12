//
//  Food.swift
//  LoloLearns
//
//  Created by Peyton Shetler on 6/15/22.
//

import Foundation

enum Food: String, CaseIterable, FlashCardItem {
    case apple
    case banana
    case watermelon
    case pizza
    case avocado
    case strawberry
    case blueberry
    case pineapple
    case lemon
    case grapes
    case cheese
    case egg
    case pear
    case orange
    case carrot
    case broccoli
    case potato
    
    var name: String {
        return self.rawValue
    }
    
    var cardType: FlashCardType {
        return .food
    }
    
    var symbol: String {
        switch self {
        
        case .apple: return "🍎"
        case .banana: return "🍌"
        case .watermelon: return "🍉"
        case .pizza: return "🍕"
        case .avocado: return "🥑"
        case .strawberry: return "🍓"
        case .blueberry: return "🫐"
        case .pineapple: return "🍍"
        case .lemon: return "🍋"
        case .grapes: return "🍇"
        case .cheese: return "🧀"
        case .egg: return "🥚"
        case .pear: return "🍐"
        case .orange: return "🍊"
        case .carrot: return "🥕"
        case .broccoli: return "🥦"
        case .potato: return "🥔"
        }
    }
}
