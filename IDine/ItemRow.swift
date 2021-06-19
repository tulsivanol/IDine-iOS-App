//
//  ItemRow.swift
//  IDine
//
//  Created by Tulsi Vanol on 07/09/20.
//  Copyright © 2020 Tulsi Vanol. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    var item:MenuItem
    static let colors:[String:Color] = ["D":.purple,"G":.black,"N":.red,"S":.blue,"V":.green]
    var body: some View {
        NavigationLink(destination:ItemDetail(item:item)){
            HStack{
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray,lineWidth:1))
                VStack(alignment:.leading){
                    Text(item.name)
                        .font(.headline)
                    Text("$\(item.price)")
                }.layoutPriority(1)
                Spacer()
                ForEach(item.restrictions,id:\.self){restriction in
                    Text(restriction).font(.caption).fontWeight(.black).padding(5).foregroundColor(.white).background(Self.colors[restriction,default:.black]).clipShape(Circle())
                }
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
