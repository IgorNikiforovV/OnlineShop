//
//  ProductRow.swift
//  OnlineShop
//
//  Created by Игорь Никифоров on 15.01.2025.
//

import SwiftUI

struct ProductRow: View {

    // MARK: - Properties
    let product: Product

    // MARK: - Body
    var body: some View {
        ZStack(alignment: .trailing) {
            HStack(spacing: 20) {

                // MARK: - Image
                if let url = URL(string: product.image) {
                    CardImageView(url: url, size: CGSize(width: 100, height: 100 ))
                }
                // MARK: - Info
                VStack(alignment: .leading, spacing: 20) {
                    Text(product.name)
                        .titleFont
                        .lineLimit(1)
                    Text("$\(product.textPrice)")
                        .subtitleFont
                        .lineLimit(1)
                }

                Spacer()
            }
            .padding(10)
            .background(.background)
            .cornerRadius(20)

            RemoteControlRowView(product: product)
        }
        .shadow(color: .black.opacity(0.1), radius: 7, x: 5 , y: 6)
        .padding(.horizontal, 10)
    }
}

#Preview {
    NavigationStack {
        ProductRow(product: Product(
            id: "12345",
            name: "iPhone PRO MAX",
            description: "The most recognizable phone. When did cell phones first appear in movies? The first appearance of a mobile phone in a movie was in the 1987 film Wall Street in the form of a Motorola DynaTAC 8000x. When commercial mobile phones launched in 1983, only the ultra-wealthy could afford the hefty price tag of $3,995 (or nearly $12,600 in today’s dollars). This created an initial association with status and greed for the colloquial “brick phone.”",
            image: "https://firebasestorage.googleapis.com/v0/b/onlineshop-809e7.firebasestorage.app/o/products%2F5.webp?alt=media&token=a00e7ed7-53fa-4a16-884d-e9f527ed83aa",
            price: 999,
            isFavorite: false,
            quantityInCart: 5
        ))
    }
}
