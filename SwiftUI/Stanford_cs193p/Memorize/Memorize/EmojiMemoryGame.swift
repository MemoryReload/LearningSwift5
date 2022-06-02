//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by sensoro on 2022/6/2.
//

import Foundation
 
class EmojiMemoryGame: ObservableObject {
    static var emojis = ["🚂","🚀","🚁","🚜","🚗","🚌","🚓","🚙","🚚","🚛","🛵","🛺","🏎","🚔","🚃","🚞","🚘","🚆","🚅","🚖","🚊","🚉","🛸","🛰","🚟"]
    
    @Published private var model = MemorizeGame(countOfCardPairs: 4) { emojis[$0] }
    
    var cards: [MemorizeGame<String>.Card] {
        model.cards
    }
    
    func choose(_ card: MemorizeGame<String>.Card) {
        model.chooseCard(card)
    }
}
