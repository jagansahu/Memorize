//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jagan Sahu on 2021-10-14.
//

import Foundation

//Model
//have to put in cardcontent, since Card type uses it
struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    private var indexOfOnlyCardFaceUp: Int?
    
    mutating func choose(_ card: Card) {
        //commas are AND in async order when if-statement is being executed
        if let indexChosen = cards.firstIndex(where: { $0.id == card.id }),
                   !cards[indexChosen].isFaceUp,
                   !cards[indexChosen].isMatched {
                if let potentialIndexMatch = indexOfOnlyCardFaceUp {
                        if cards[indexChosen].content == cards[potentialIndexMatch].content {
                            cards[indexChosen].isMatched = true
                            cards[potentialIndexMatch].isMatched = true
                        }
                        indexOfOnlyCardFaceUp = nil
                } else {
                        for index in cards.indices {
                            cards[index].isFaceUp = false
                        }
                        indexOfOnlyCardFaceUp = indexChosen
                }
                cards[indexChosen].isFaceUp.toggle()
        }
    }
    
    //initializes cards arr with # of pairs provided in viewmodel
    init(numberOfPairOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for index in 0..<numberOfPairOfCards {
            let content = createCardContent(index)
            //add 2 of the same cards into cards arr
            cards.append( Card(content: content, id: index*2) )
            cards.append( Card(content: content, id: index*2+1) )
        }
         
    }

    //Card type defintion
    struct Card: Identifiable  {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
