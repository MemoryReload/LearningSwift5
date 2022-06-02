//
//  Memorize.swift
//  Memorize
//
//  Created by sensoro on 2022/6/2.
//

import Foundation

struct  MemorizeGame<Content> {
    
    struct Card: Identifiable {
        var id: Int
        var content: Content
        var isMatched: Bool = false
        var isFaceUp: Bool = false
    }
    
    private(set) var cards: [Card]
    
    init(countOfCardPairs pairs: Int, cardContent: (Int) -> Content) {
        cards = []
        for i in 0..<pairs {
            let content = cardContent(i)
            cards.append(Card(id:i*2,content: content))
            cards.append(Card(id:i*2+1,content: content))
        }
    }
    
    mutating func chooseCard(_ card: Card) {
        let sIndex = indexOf(card)
        cards[sIndex].isFaceUp.toggle()
    }
    
    func indexOf(_ card: Card) -> Int {
        for (index, _card) in cards.enumerated() {
            if _card.id == card.id  {
                return index
            }
        }
        return 0
    }
}
