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
    
//    @ViewBuilder
//    func carView(forCard card: EmojiMemoryGame.Card) -> some View {
//        if card.isMatched && !card.isFaceUp {
//            Rectangle().opacity(0)
//        }else{
//            CardView(card: card)
//                .padding(5)
//                .onTapGesture {
//                    game.choose(card)
//                }
//        }
//    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                    Pie(startAngle: Angle(degrees: -90), endAngel: Angle(degrees: 20), clockwise: true).padding(5).opacity(0.5)
                    Text(card.content)
                    .rotationEffect(Angle(degrees: card.isMatched ? 360 : 0))
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false))
                    .font(Font.system(size: DrawingConfig.fontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConfig.fontSize / DrawingConfig.fontScale)
    }
    
    private func fontForSize(_ size: CGSize) -> Font {
        .system(size: min(size.width, size.height) * DrawingConfig.fontScale)
    }
    
    private struct DrawingConfig {
        static let fontScale: CGFloat = 0.65
        static let fontSize: CGFloat = 32
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let emojiGame = EmojiMemoryGame()
        emojiGame.choose(emojiGame.cards.first!)
        return Group {
            EmojiMemoryGameView(game: emojiGame)
                .preferredColorScheme(.light)
            EmojiMemoryGameView(game: emojiGame)
                .preferredColorScheme(.dark)
        }
    }
}
