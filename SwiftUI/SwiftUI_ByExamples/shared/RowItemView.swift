//
//  RowItemView.swift
//  idine
//
//  Created by 何平 on 2020/11/27.
//

import SwiftUI

struct RowItemView: View {
    static let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    var item: MenuItem
    
    var body: some View {
        NavigationLink(
            destination: ItemDetailView(item: item)){
                HStack{
                    Image(item.thumbnailImage)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                    VStack(alignment: .leading){
                        Text(item.name)
                            .font(.headline)
                        Text("$\(item.price)")
                    }
                    Spacer()
                    ForEach(item.restrictions, id: \.self) { restriction in
                        Text(restriction)
                            .font(.caption)
                            .fontWeight(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                            .padding(5)
                            .background(Self.colors[restriction, default:.black])
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                }
            }
    }
}

struct RowItemView_Previews: PreviewProvider {
    static var previews: some View {
        RowItemView(item: MenuItem.example)
    }
}
