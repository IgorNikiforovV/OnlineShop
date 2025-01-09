//
//  ProductCardView.swift
//  OnlineShop
//
//  Created by Игорь Никифоров on 08.01.2025.
//

import SwiftUI

struct ProductCardView: View {
    let product : Product

    // MARK: - Body
    var body: some View {
        GeometryReader { geo in
            let size = geo.size

            ZStack(alignment: .topTrailing) {
                if let url = URL(string: product.image) {
                    CardImageView(url: url, size: size)

                    Button {

                    } label: {
                        Image(systemName: "heart.fill")
                            .padding(6)
                            .foregroundColor(product.isFavorite ? .red : .white)
                            .background(.black)
                            .clipShape(Circle())
                            //.padding()
                    }

                }
            }
        }
        .frame(height: UIScreen.main.bounds.width * 0.6)
        .background(.background.opacity(0.5))
        .padding(10)
    }
}

#Preview {
    ProductCardView(
        product: Product(
            id: "12345",
            name: "iPhone PRO MAX",
            description: "The most recognizable phone",
            image: "https://firebasestorage.googleapis.com/v0/b/onlineshop-809e7.firebasestorage.app/o/products%2F5.webp?alt=media&token=a00e7ed7-53fa-4a16-884d-e9f527ed83aa",
            price: 999,
            isFavorite: false,
            quantityInCart: nil
        )
    )
}