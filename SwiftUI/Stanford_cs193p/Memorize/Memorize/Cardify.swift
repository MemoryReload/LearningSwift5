//
//  Cardify.swift
//  Memorize
//
//  Created by sensoro on 2022/7/12.
//

import SwiftUI

struct Cardify: ViewModifier {
    let faceUp: Bool
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConfig.cornerRadius )
            if self.faceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConfig.lineWith)
            } else{
                shape.fill()
            }
            content.opacity(faceUp ? 1 : 0)
        }
    }
    
    private struct DrawingConfig {
        static let cornerRadius: CGFloat = 8
        static let lineWith: CGFloat = 3
    }
}


extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(faceUp: isFaceUp))
    }
}
