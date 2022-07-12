//
//  FlashCard.swift
//  LoloLearns
//
//  Created by Peyton Shetler on 6/15/22.
//

import Foundation

enum FlashCardType {
    case animal
    case food
}


protocol FlashCardItem {
    var name: String { get }
    var symbol: String { get }
    var cardType: FlashCardType { get }
}


struct FlashCard: Identifiable, Hashable {
    var id = UUID().uuidString
    var name: String
    var symbol: String
    
    var index: Int
    
    var cardType: FlashCardType
    
    /// I hate this but auto adjusting font sizes using
    /// '.minimumScaleFactor' look really bad with the
    /// current card size animation.
    var fontSize: CGFloat {
        let count = name.count
        
        /// 0-12  @ size 40
        if count <= 12 {
            return 40
        }
        /// 13-15 char max @ size 36
        else if count >= 13 && count <= 15 {
            return 36
        }
        /// 16-17 char max @ size 32
        else if count >= 16 && count <= 17 {
            return 32
        }
        /// 18-19 char max @ size 28
        else if count >= 18 && count <= 19 {
            return 28
        }
        /// 20+ char max @ size 24
        else {
            return 24
        }
    }
    
    init(index: Int, item: FlashCardItem) {
        self.name = item.name
        self.symbol = item.symbol
        self.cardType = item.cardType
        self.index = index
    }
    
    static func getTestItems() -> [FlashCard] {
        let cards: [FlashCardItem] = [Animal.sheep, Food.potato, Animal.cow]
        return cards.enumerated().map { FlashCard(index: $0.offset, item: $0.element) }
    }

    static func getAllAnimals() -> [FlashCard] {
        return Animal.allCases.enumerated().map { FlashCard(index: $0.offset, item: $0.element) }
    }
    
    static func getAllFood() -> [FlashCard] {
        return Food.allCases.enumerated().map { FlashCard(index: $0.offset, item: $0.element) }
    }
    
    static func getDeck() -> [FlashCard] {
        var cards = getAllAnimals() + getAllFood()
        cards.shuffle()
        
        var enumerated: [FlashCard] = []
        
        for (index, var card) in cards.enumerated() {
            card.index = index
            enumerated.append(card)
        }
        
        return enumerated
    }
}
