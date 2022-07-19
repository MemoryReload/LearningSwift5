//
//  Cardify.swift
//  Memorize
//
//  Created by sensoro on 2022/7/12.
//

import SwiftUI

struct Cardify: AnimatableModifier /* ViewModifier, Animatable */ {
    var rotation: CGFloat
    var animatableData: CGFloat {
        get { rotation }
        set {
            print("rotation = \(newValue)")
            rotation = newValue
        }
    }
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConfig.cornerRadius )
            if rotation > 90 {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConfig.lineWith)
            } else{
                shape.fill()
            }
            content.opacity(rotation > 90 ? 1 : 0)
        }
        .rotation3DEffect(Angle(degrees: rotation), axis: (x: 0, y: 1, z: 0))
    }
    
    private struct DrawingConfig {
        static let cornerRadius: CGFloat = 8
        static let lineWith: CGFloat = 3
    }
    
    init(faceUp: Bool) {
        rotation = faceUp ? 180 : 0
    }
}


extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(faceUp: isFaceUp))
    }
}
