//
//  DetailView.swift
//  OnlineShop
//
//  Created by Игорь Никифоров on 13.01.2025.
//

import SwiftUI

struct DetailView: View {

    // MARK: - Properties
    let product: Product

    // MARK: - Body
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                if let url = URL(string: product.image) {
                    CardImageView(url: url, size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.7))
                        .ignoresSafeArea()
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 8)
                }

                DetailInfoView(product: product)
            }
            .background(.secondary.opacity(0.3))
            .navigationBarBackButtonHidden()

            BackButtonView()
                .padding(.leading)
        }
    }
}

#Preview {
    DetailView(product: Product(
        id: "12345",
        name: "iPhone PRO MAX",
        description: "The most recognizable phone. When did cell phones first appear in movies? The first appearance of a mobile phone in a movie was in the 1987 film Wall Street in the form of a Motorola DynaTAC 8000x. When commercial mobile phones launched in 1983, only the ultra-wealthy could afford the hefty price tag of $3,995 (or nearly $12,600 in today’s dollars). This created an initial association with status and greed for the colloquial “brick phone.”",
        image: "https://firebasestorage.googleapis.com/v0/b/onlineshop-809e7.firebasestorage.app/o/products%2F5.webp?alt=media&token=a00e7ed7-53fa-4a16-884d-e9f527ed83aa",
        price: 999,
        isFavorite: false,
        quantityInCart: nil
    ))
}
