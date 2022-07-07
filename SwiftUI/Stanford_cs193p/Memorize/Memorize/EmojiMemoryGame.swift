//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by sensoro on 2022/6/2.
//

import Foundation
 
class EmojiMemoryGame: ObservableObject {
    typealias Card = MemorizeGame<String>.Card
    
    private static var emojis = ["🚂","🚀","🚁","🚜","🚗","🚌","🚓","🚙","🚚","🚛","🛵","🛺","🏎","🚔","🚃","🚞","🚘","🚆","🚅","🚖","🚊","🚉","🛸","🛰","🚟"]
    
    @Published private var model = MemorizeGame(countOfCardPairs: 4) { emojis[$0] }
    
    var cards: [Card] {
        model.cards
    }
    
    func choose(_ card: Card) {
        model.chooseCard(card)
    }
}
