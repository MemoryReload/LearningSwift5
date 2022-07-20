//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by HePing on 2022/5/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    @State var dealedCards: Set<Int> = []
    
    func dealCard(_ card: EmojiMemoryGame.Card) {
        dealedCards.insert(card.id)
    }
    
//    func dealCards(_ cards: [EmojiMemoryGame.Card]) {
//        dealedCards = Set(cards.map{ $0.id })
//    }
    
    func isDealedCard(_ card: EmojiMemoryGame.Card) -> Bool {
        dealedCards.contains(card.id)
    }
    
    var body: some View {
        VStack {
            AspectVGrid(items:game.cards, aspectRatio: 2/3) { card in
                //            carView(forCard: card)
                if !isDealedCard(card)  || card.isMatched && !card.isFaceUp {
                    Color.clear
                }else{
                    CardView(card: card)
                        .padding(5)
                        .transition(
                            AnyTransition.asymmetric(
                                insertion:AnyTransition.scale,
                                removal:AnyTransition.opacity
                            )
                            .animation(.easeInOut(duration: 1))
                        )
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 1)) {
                                game.choose(card)
                            }
                        }
                }
            }
            .padding([.leading,.trailing], 5)
            .foregroundColor(.red)
            .onAppear {
                for card in game.cards {
                    dealCard(card)
                }
                //                dealCards(game.cards)
            }
            //            .onChange(of: game.cards) { newValue in
            //                print("cards: \(newValue)")
            //            }
            Spacer(minLength: 20)
            Button("Shuffle") {
                withAnimation {
                    game.shuffleCards()
                }
            }
        }
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

//extension EmojiMemoryGame.Card: Equatable where Content == String {
//    static func == (lhs: MemorizeGame.Card, rhs: MemorizeGame.Card) -> Bool {
//        lhs.id == rhs.id && lhs.content == rhs.content && lhs.isFaceUp == rhs.isFaceUp && lhs.isMatched == rhs.isMatched
//    }
//}

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
