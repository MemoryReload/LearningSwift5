//
//  ContentView.swift
//  Memorize
//
//  Created by HePing on 2022/5/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚂","🚀","🚁","🚜","🚗","🚌","🚓","🚙","🚚","🚛","🛵","🛺","🏎","🚔","🚃","🚞","🚘","🚆","🚅","🚖","🚊","🚉","🛸","🛰","🚟"]
    @State var emojiCount = 4
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.system(size: 24, weight: .semibold)).frame(height: 64, alignment: .center)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(emojis[0..<emojiCount],id:\.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            HStack {
                remove
                Spacer() // expanded
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
            .border(.red)
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
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
