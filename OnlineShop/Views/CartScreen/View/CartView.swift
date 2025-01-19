//
//  CartView.swift
//  OnlineShop
//
//  Created by Игорь Никифоров on 08.01.2025.
//

import SwiftUI
import FirebaseFirestore


struct CartView: View {

    // MARK: - Properties
    @EnvironmentObject var viewModel: ViewModel
    @FirestoreQuery(collectionPath: "shop") private var items: [Product]

    // MARK: - Body
    var body: some View {

            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(items.filter { ($0.quantityInCart ?? 0) > 0 }) { item in
                        ProductRow(product: item)
                    }
                }

                Text("Total: \(viewModel.totalPrice)")
                    .titleFont
                    .padding(.bottom)
                CustomMainButton(title: "Buy") {}
                .padding(.horizontal, 30)
            }
        .navigationTitle("Cart")
        .background(.secondary.opacity(0.3))
    }
}

#Preview {
    CartView()
        .environmentObject(ViewModel())
}
