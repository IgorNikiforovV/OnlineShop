//
//  DetailView.swift
//  OnlineShop
//
//  Created by Игорь Никифоров on 13.01.2025.
//

import SwiftUI

struct DetailView: View {
    let product: Product

    var body: some View {
        VStack {
            if let url = URL(string: product.image) {
                CardImageView(url: url, size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.7))
                    .ignoresSafeArea()
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 8)
            }

            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text(product.name)
                        .titleFont
                    Spacer()
                    Text("$\(product.textPrice)")
                        .titleFont
                }

                Text(product.description)
                    .subtitle
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .lineLimit(6)

                Spacer()

                Button {
                    // add to cart
                } label: {
                    Text("Add to cart")
                        .frame(maxWidth: .infinity)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.black)
                        .clipShape(Capsule())
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 8)
                }
            }
            .padding(.horizontal, 30)
        }
        .background(.secondary.opacity(0.3))
    }
}

#Preview {
    DetailView(product: Product(
        id: "12345",
        name: "iPhone PRO MAX",
        description: "The most recognizable phone",
        image: "https://firebasestorage.googleapis.com/v0/b/onlineshop-809e7.firebasestorage.app/o/products%2F5.webp?alt=media&token=a00e7ed7-53fa-4a16-884d-e9f527ed83aa",
        price: 999,
        isFavorite: false,
        quantityInCart: nil
    ) )
}
