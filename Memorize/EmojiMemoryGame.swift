//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jagan Sahu on 2021-10-14.
//

import SwiftUI //bc its the viewmodel, and part of ui

//intermediary between model and view
class EmojiMemoryGame: ObservableObject {
    
    //static makes ONE only for all instances of this object
    static let emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🚨", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠"]
    
    //initializes constructs cards in MemoryGame(model)
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairOfCards: 4) { index in
            emojis[index]
        }
    }
        
    //can only look at em but cant modify
    @Published private var model: MemoryGame<String> = createMemoryGame()
    //anytime model changes, objectWillChange sends out that somethigngs changed and whole ui is rebuilt
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}




struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
