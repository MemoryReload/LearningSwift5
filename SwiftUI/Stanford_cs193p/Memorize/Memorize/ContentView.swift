//
//  ContentView.swift
//  Memorize
//
//  Created by HePing on 2022/5/21.
//

import SwiftUI

struct ContentView: View {
    static let emojis_vehicle = ["🚂","🚀","🚁","🚜","🚗","🚌","🚓","🚙","🚚","🚛","🛵","🛺","🏎","🚔","🚃","🚞","🚘","🚆","🚅","🚖","🚊","🚉"]
    static let emojis_face = ["😀","😃","😄","😁","😆","🥹","😅","😂","🤣","🥲","☺️","😊","😇","🙂","🙃","😉","😌","😍","🥰","😘","😗","🤪"]
    static let emojis_animal = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🦁","🐮","🐷","🐸","🐵","🐔","🐧","🐦","🐤","🦆","🦉"]
    static let count = 8
        
    @State var emojis : [String] = randomCard(from: emojis_vehicle)
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.system(size: 24, weight: .semibold)).frame(height: 44, alignment: .center)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(emojis[0..<emojis.count],id:\.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            toolBar
        }
        .padding(.horizontal)
    }
    
    var toolBar: some View {
        HStack {
            BarItemView(image: "car", title: "Vehicles") {
                emojis = Self.randomCard(from: Self.emojis_vehicle)
            }
            Spacer() // expanded
            BarItemView(image: "person", title: "Mojis") {
                emojis = Self.randomCard(from: Self.emojis_face)
            }
            Spacer()
            BarItemView(image: "pawprint", title: "Animals") {
                emojis = Self.randomCard(from: Self.emojis_animal)
            }
        }
        .font(.largeTitle)
        .padding(.horizontal)
    }
    
     static func randomCard(from cards: [String]) -> [String] {
        guard cards.count > count else { return [] }
        let tempCard = cards.shuffled()
        return Array(tempCard[0..<count])
    }
}

struct BarItemView: View {
    var image: String
    var title: String
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Image(systemName: image)
                Text(title)
                    .font(.body)
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }else{
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
