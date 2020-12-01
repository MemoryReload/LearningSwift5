//
//  OrderView.swift
//  idine
//
//  Created by 何平 on 2020/11/30.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView{
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                }
                
                Section {
                    NavigationLink(
                        destination: Text("Destination")){
                        Text("Place Order")
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Order")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static let order: Order = { () -> Order in
        var newOrder = Order()
        newOrder.add(item: MenuItem.example)
        return newOrder
    }()
    
    static var previews: some View {
            OrderView().environmentObject(order)
    }
}
