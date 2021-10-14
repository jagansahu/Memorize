//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jagan Sahu on 2021-10-14.
//

import SwiftUI //bc its the viewmodel, and part of ui

//func makeCardContent(index: Int) -> String {
//    return "🚗"
//} 

//intermediary between model and view
class EmojiMemoryGame {
    
    //static makes ONE only for all instances of this object
    static let emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🚨", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠"]
    
    static func createMemeoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairOfCards: 4) {index in
            emojis[index]
        }
    }
    
    //can only look at em but cant modify
    private(set) var model: MemoryGame<String> = createMemeoryGame()
        
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}



