//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Jagan Sahu on 2021-07-11.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame() //view model
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
