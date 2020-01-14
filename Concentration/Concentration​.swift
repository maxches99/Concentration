//
//  Concentration​.swift
//  Concentration
//
//  Created by Максим Чесников on 13.01.2020.
//  Copyright © 2020 Максим Чесников. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    var flipCount = 0
    
    var score = 0
    
    var theme = DataThemes()
    
    var oldCards = [99]
    
    func chooseCard(at index: Int)
    {
        if !cards[index].isMatched
        {
            flipCount += 1
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index
            {
                if cards[matchIndex].identifier == cards[index].identifier
                {
                    score += 2
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                else
                {
                    if oldCards.firstIndex(of: cards[index].identifier) != nil || oldCards.firstIndex(of: cards[index].identifier) != nil
                    {
                        score -= 1
                    }
                    if oldCards.firstIndex(of: cards[matchIndex].identifier) == nil
                    {
                        oldCards.append(cards[matchIndex].identifier)
                    }
                    if oldCards.firstIndex(of: cards[index].identifier) == nil
                    {
                        oldCards.append(cards[index].identifier)
                    }
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else
            {
                
                for flipdownIndex in cards.indices
                {
                    cards[flipdownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            
        }
    }
    

    
    func newGame()
    {
        for index in cards.indices
        {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        flipCount = 0
        score = 0
        cards.shuffle()
        oldCards.removeAll()
        oldCards = [99]
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards
        {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    init() {
    }
}
