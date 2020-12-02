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
    @State var paymentType = "Cash"
    @State var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State var tipIndex = 0
    
    var body: some View {
        Form{
            Section {
                Picker("How do you want to pay?",selection: $paymentType){
                    ForEach(Self.paymentTypes, id: \.self){
                        Text($0)
                    }
                }
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
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
