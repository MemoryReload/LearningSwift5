//
//  ItemDetailView.swift
//  idine
//
//  Created by 何平 on 2020/11/27.
//

import SwiftUI

struct ItemDetailView: View {
    @EnvironmentObject var order: Order
    var item: MenuItem
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("Photo: \(item.photoCredit)")
                    .font(.caption)
                    .padding(4)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            Button("Order This") {
                self.order.add(item: self.item)
            }.font(.headline)
            Spacer()
        }
        .navigationBarTitle(item.name, displayMode: .inline)
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        NavigationView{
            ItemDetailView(item: MenuItem.example).environmentObject(order)
        }
    }
}
