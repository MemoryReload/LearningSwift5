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
        GeometryReader { geometry in
            let width: CGFloat = withThatFits(itemCount: items.count, size: geometry.size, itemAspectRatio: aspectRatio)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: width), spacing: 0)], spacing: 0) {
                                ForEach(items) { item in
                                    content(item)
                                    .aspectRatio(aspectRatio, contentMode: .fit)
                                }
            }
        }
    }
    
    func withThatFits(itemCount: Int, size: CGSize, itemAspectRatio: CGFloat) -> CGFloat {
        var columnCount = 1
        var rowCount = itemCount
        repeat {
            let itemWidth = size.width / CGFloat(columnCount)
            let itemHeight = itemWidth/itemAspectRatio
            if CGFloat(rowCount) * itemHeight < size.height {
                break
            }
            columnCount += 1
            rowCount = (itemCount + ( columnCount - 1)) / columnCount
        } while columnCount < itemCount
        if columnCount > itemCount {
            columnCount = itemCount
        }
        return floor(size.width / CGFloat(columnCount))
    }
}
