//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Prakhar Trivedi on 23/3/23.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var orderObject: OrderObject
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $orderObject.order.name)
                TextField("Street address", text: $orderObject.order.streetAddress)
                TextField("City", text: $orderObject.order.city)
                TextField("Zip", text: $orderObject.order.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(orderObject: orderObject)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(orderObject.order.checkoutLinkIsDisabled)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { // To view the nav bar in our previews too
            AddressView(orderObject: OrderObject())
        }
    }
}
