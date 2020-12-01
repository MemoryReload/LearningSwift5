//
//  CheckoutView.swift
//  idine-UIKit
//
//  Created by 何平 on 2020/12/1.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    @State var paymentTypeIndex = 0
    var body: some View {
        VStack{
            Section {
                Picker("How do you want to pay?",selection: $paymentTypeIndex){
//                    ForEach(0..<Self.paymentTypes.count) {
//                        Text(Self.paymentTypes[$0])
//                    }
                    ForEach(Self.paymentTypes, id: \.self){
                        Text($0)
                    }
                }
            }
        }
        .navigationBarTitle("Payment", displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        NavigationView{
            CheckoutView()
        }.environmentObject(order)
    }
}
