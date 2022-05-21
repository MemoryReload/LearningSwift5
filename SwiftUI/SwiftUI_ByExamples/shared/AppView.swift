//
//  AppView.swift
//  idine-UIKit
//
//  Created by 何平 on 2020/12/1.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            MenuView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order: Order = { () -> Order in
        var newOrder = Order()
        newOrder.add(item: MenuItem.example)
        return newOrder
    }()
    
    static var previews: some View {
        AppView().environmentObject(order)
    }
}
