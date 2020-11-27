//
//  ContentView.swift
//  idine
//
//  Created by 何平 on 2020/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let sections = Bundle.main.decode([MenuSection].self, from: "menu.json")
        NavigationView{
            List{
                ForEach(sections){ section in
                    Section(header:Text(section.name)){
                        ForEach(section.items){
                            RowItemView(item: $0)
                        }
                    }
                }
            }
            .navigationBarTitle("Title", displayMode:.inline)
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
