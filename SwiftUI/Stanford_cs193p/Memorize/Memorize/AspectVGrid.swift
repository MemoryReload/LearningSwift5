//
//  AspectVGrid.swift
//  Memorize
//
//  Created by sensoro on 2022/6/21.
//

import SwiftUI

struct AspectVGrid<Item, Content>: View where Item: Identifiable, Content: View {
    var items: [Item]
    var aspectRatio: CGFloat
    var content: (Item) -> Content
    var body: some View {
        let width: CGFloat = 80
        LazyVGrid(columns: [GridItem(.adaptive(minimum: width))]) {
                            ForEach(items) { item in
                                content(item)
                                .aspectRatio(aspectRatio, contentMode: .fit)
                            }
                        }
    }
}
