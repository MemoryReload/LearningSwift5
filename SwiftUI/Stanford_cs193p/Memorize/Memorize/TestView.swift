//
//  TestView.swift
//  Memorize
//
//  Created by sensoro on 2022/5/30.
//

import SwiftUI

struct TestView1: View {
    var body: some View {
        VStack {
            Text("Today's Weather")
                .font(.title)
                .border(.red)
            HStack {
                Text("🌧")
                Text("Rain & Thunderstorms")
                Text("⛈")
            }
            .alignmentGuide(HorizontalAlignment.center) { _ in  50 }
            .border(.red)
        }
        .border(.red)
    }
}

struct TestView2: View {
    var body: some View {
        VStack {
            Text("Today's Weather")
                .font(.title)
                .border(.red)
            
            HStack {
                Text("🌧")
                    .alignmentGuide(VerticalAlignment.center) { _ in -20 }
                    .border(.red)
                Text("Rain & Thunderstorms")
                    .border(.red)
                Text("⛈")
                    .alignmentGuide(VerticalAlignment.center) { _ in 20 }
                    .border(.red)
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView1()
        TestView2()
    }
}
