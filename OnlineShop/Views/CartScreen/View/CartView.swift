//
//  CartView.swift
//  OnlineShop
//
//  Created by Игорь Никифоров on 08.01.2025.
//

import SwiftUI


struct CartView: View {
    var body: some View {

            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                }
            }
        .navigationTitle("Cart")
        .background(.secondary.opacity(0.3))
    }
}

#Preview {
    CartView()
}
