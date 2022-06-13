//
//  Memorize.swift
//  Memorize
//
//  Created by sensoro on 2022/6/2.
//

import Foundation

struct  MemorizeGame<Content> where Content: Equatable {
    
    var prematchedIndex: Int?
    
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
        cards = cards.shuffled() //radom the card sequeence
    }
    
    mutating func chooseCard(_ card: Card) {
        let sIndex = cards.firstIndex{ $0.id == card.id }
        if let index = sIndex, cards[index].isFaceUp == false, cards[index].isMatched == false {
            if let matchIndex = prematchedIndex {
                if cards[index].content == cards[matchIndex].content {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                prematchedIndex = nil
            }else{
                for i in cards.indices {
                    if i == index  {
                        prematchedIndex = index
                    }else{
                        cards[i].isFaceUp = false
                    }
                }
            }
            cards[index].isFaceUp.toggle()
        }
    }
    
}
