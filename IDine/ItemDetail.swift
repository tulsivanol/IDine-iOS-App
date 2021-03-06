//
//  ItemDetail.swift
//  IDine
//
//  Created by Tulsi Vanol on 07/09/20.
//  Copyright © 2020 Tulsi Vanol. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order:Order
    var item:MenuItem
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x:-20,y:-5)
            }
            Text(item.description).padding(.horizontal, 20)
            Button("Order"){
                self.order.add(item: self.item)
            }.font(.headline).padding(.top,10)
            Spacer()
        }.navigationBarTitle(Text(item.name),displayMode: .inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        NavigationView{
            ItemDetail( item: MenuItem.example).environmentObject(order)
        }
    }
}
