//
//  Memorize.swift
//  Memorize
//
//  Created by sensoro on 2022/6/2.
//

import Foundation

struct  MemorizeGame<Content> where Content: Equatable {
    
    private var prematchedIndex: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp}).oneAndOnly }
        set { cards.indices.forEach{ cards[$0].isFaceUp = $0 == newValue} }
    }
    
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
        shuffle()
    }
    
    mutating func chooseCard(_ card: Card) {
        if let index = cards.firstIndex(where: { $0.id == card.id }),
           cards[index].isFaceUp == false,
           cards[index].isMatched == false {
            if let matchIndex = prematchedIndex {
                if cards[index].content == cards[matchIndex].content {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFaceUp = true
            }else{
                prematchedIndex = index
            }
        }
    }
    
    mutating func shuffle() {
        cards = cards.shuffled() //radom the card sequeence
    }
    
}

extension Array {
    var oneAndOnly: Element? { self.count == 1 ? self.first : nil }
}
