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
//            ScrollView {
//                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
//                    ForEach(game.cards) { card in
//                        CardView(card: card)
//                        .aspectRatio(2/3, contentMode: .fit)
//                        .onTapGesture {
//                            game.choose(card)
//                        }
//                    }
//                }
//            }
        AspectVGrid(items:game.cards, aspectRatio: 2/3) { card in
            CardView(card: card).onTapGesture {
                                        game.choose(card)
                                    }
        }
        .padding([.leading,.trailing], 5)
            .foregroundColor(.red)
//            .edgesIgnoringSafeArea([.all])
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
            .padding(5)
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
