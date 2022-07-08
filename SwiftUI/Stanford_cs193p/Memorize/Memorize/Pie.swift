//
//  Pie.swift
//  Memorize
//
//  Created by sensoro on 2022/7/8.
//

import SwiftUI

struct Pie: Shape {
    var startAngle: Angle
    var endAngel: Angle
    var clockwise: Bool = false
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * CGFloat(cos(startAngle.radians)),
            y: center.y + radius * CGFloat(sin(startAngle.radians))
        )
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngel,
            clockwise: clockwise
        )
        p.closeSubpath()
        return p
    }
}
