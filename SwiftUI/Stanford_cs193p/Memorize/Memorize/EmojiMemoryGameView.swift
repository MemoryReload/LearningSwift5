//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by HePing on 2022/5/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    var body: some View {
        AspectVGrid(items:game.cards, aspectRatio: 2/3) { card in
//            carView(forCard: card)
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            }else{
                CardView(card: card)
                    .padding(5)
                    .onTapGesture {
                                            game.choose(card)
                                        }
            }
        }
        .padding([.leading,.trailing], 5)
            .foregroundColor(.red)
    }
    
    @ViewBuilder
    func carView(forCard card: EmojiMemoryGame.Card) -> some View {
        if card.isMatched && !card.isFaceUp {
            Rectangle().opacity(0)
        }else{
            CardView(card: card)
                .padding(5)
                .onTapGesture {
                    game.choose(card)
                }
        }
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConfig.cornerRadius )
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConfig.lineWith)
                    Text(card.content).font(fontForSize(geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                }else{
                    shape.fill()
                }
            }
        }
    }
    
    private func fontForSize(_ size: CGSize) -> Font {
        .system(size: min(size.width, size.height) * DrawingConfig.fontScale)
    }
    
    private struct DrawingConfig {
        static let cornerRadius: CGFloat = 8
        static let lineWith: CGFloat = 3
        static let fontScale: CGFloat = 0.65
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let emojiGame = EmojiMemoryGame()
        EmojiMemoryGameView(game: emojiGame)
            .preferredColorScheme(.light)
        EmojiMemoryGameView(game: emojiGame)
            .preferredColorScheme(.dark)
    }
}
