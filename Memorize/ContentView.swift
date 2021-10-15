//
//  ContentView.swift
//  Memorize
//
//  Created by Jagan Sahu on 2021-07-11.
//

import SwiftUI

//View
struct ContentView: View {
    
     //when viewmodel changes, rebuild whole body
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(.red)
        .padding(.horizontal)
        
    }
    
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            //use let for constants (stuff that will never change)
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                //for fill
                shape.fill().foregroundColor(.white)
                //for outer line
                shape.strokeBorder(lineWidth: 3)
                //emojies
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
            
        }
    }
}



























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        Group {
            ContentView(viewModel: game)
                .preferredColorScheme(.dark)
        }
    }
}
