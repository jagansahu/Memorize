//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jagan Sahu on 2021-10-14.
//

import SwiftUI //bc its the viewmodel, and part of ui

//intermediary between model and view
class EmojiMemoryGame {
    
    //static makes ONE only for all instances of this object
    static let emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🚨", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠"]
    
    //initializes constructs cards in MemoryGame(model)
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairOfCards: 4) {index in
            emojis[index]
        }
    }
    
    //can only look at em but cant modify
    private(set) var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}



