//
//  CheckoutView.swift
//  IDine
//
//  Created by Tulsi Vanol on 07/09/20.
//  Copyright © 2020 Tulsi Vanol. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order :Order
    
    static let paymentTypes = ["Cash","Credit Card","IDine Points"]
    
    static let tipAmounts = [0,10,15,20,25,30]
    
    @State private var paymentType=0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount=1
    @State private var showPaymentAlert = false

    var totalPrice:Double{
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        
        return total + tipValue
    }
    
    var body: some View {
        Form{
            Section{
                Picker("How do you want to pay?",selection: $paymentType){
                    ForEach(0..<Self.paymentTypes.count){
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                Toggle(isOn:$addLoyaltyDetails.animation()){
                    Text("Add IDine Loyalty Card")
                }
                
                if(addLoyaltyDetails){
                    TextField("Enter your IDine Id",text:$loyaltyNumber)
                }
            }
            
            Section(header:Text("Add a tip?")){
                Picker("Percentage:",selection:$tipAmount){
                    ForEach(0..<Self.tipAmounts.count){
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header:Text("Total : $\(totalPrice,specifier: "%.2f")").font(.largeTitle)){
                Button("Confirm Order"){
                    self.showPaymentAlert = true
                }
            }
            
        }.navigationBarTitle(Text("Payment"),displayMode: .inline)
            .alert(isPresented: $showPaymentAlert){
                Alert(title: Text("Order Confirmed"),message: Text("Your total was $\(totalPrice,specifier:"%.2f") - Thank You"),dismissButton: .default(Text("Ok")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order=Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
