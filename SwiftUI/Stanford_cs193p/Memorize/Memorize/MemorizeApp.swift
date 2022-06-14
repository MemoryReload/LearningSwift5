//
//  MemorizeApp.swift
//  Memorize
//
//  Created by HePing on 2022/5/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let emojiGame = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(game: emojiGame)
        }
    }
}
