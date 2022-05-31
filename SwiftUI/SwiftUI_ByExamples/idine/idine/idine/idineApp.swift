//
//  idineApp.swift
//  idine
//
//  Created by 何平 on 2020/11/23.
//

import SwiftUI

@main
struct idineApp: App {
    let order = Order()
    var body: some Scene {
        WindowGroup {
            AppView().environmentObject(order)
        }
    }
}
