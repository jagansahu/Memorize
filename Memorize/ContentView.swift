//
//  ContentView.swift
//  Memorize
//
//  Created by Jagan Sahu on 2021-07-11.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🚨", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠"]
    
    @State var emojiCount = 4
    
    var body: some View {
        VStack {
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            
            Spacer()
            
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        
    }
    
    var remove: some View {
        Button {
            if emojiCount>1 {
                emojiCount-=1
            }
            
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount<emojis.count {
                emojiCount+=1
            }
            
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct CardView: View {
    var content: String
    //needs to have a value, which can be initialized or get value from parameter
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            //use let for constants (stuff that will never change)
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                //for fill
                shape.fill().foregroundColor(.white)
                //for outer line
                shape.strokeBorder(lineWidth: 3)
                //emojies
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
            
        }
        .onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
}



























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
