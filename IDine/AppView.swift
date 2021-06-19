//
//  AppView.swift
//  IDine
//
//  Created by Tulsi Vanol on 07/09/20.
//  Copyright © 2020 Tulsi Vanol. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView{
            ContentView().tabItem{
                Image(systemName: "list.dash")
                Text("Menu")
            }
            
            OrderView().tabItem{
                Image(systemName: "square.and.pencil")
                Text("Order")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        AppView().environmentObject(order)
    }
}
