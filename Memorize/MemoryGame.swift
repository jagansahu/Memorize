//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jagan Sahu on 2021-10-14.
//

import Foundation

//user will have to put in cardcontent, since Card type uses it
struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    init(numberOfPairOfCards: Int, createCardContent:(Int) -> CardContent) {
        cards = Array<Card>()
        
        for index in 0..<numberOfPairOfCards {
            let content = createCardContent(index)
            //add 2 of the same cards into cards arr
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
         
    }

    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }

}