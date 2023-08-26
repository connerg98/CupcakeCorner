//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Conner Glasgow on 4/13/22.
//

import SwiftUI


struct ContentView: View {
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.count)", value: $order.count, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.specialRequests.animation())
                    
                    if order.specialRequests {
                        Toggle("Add extra frosting", isOn: $order
                                .extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.sprinkels)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery Details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
