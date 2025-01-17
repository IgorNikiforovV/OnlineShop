//
//  DetailInfoView.swift
//  OnlineShop
//
//  Created by Игорь Никифоров on 15.01.2025.
//

import SwiftUI

struct DetailInfoView: View {

    // MARK: - Properties
    @EnvironmentObject var viewModel: ViewModel
    let product: Product

    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text(product.name)
                    .titleFont
                Spacer()
                Text("$\(product.textPrice)")
                    .titleFont
            }

            Text(product.description)
                .subtitleFont
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .lineLimit(6)

            Spacer()

            CustomMainButton(title: "Add to cart") {
                viewModel.addToCatr(product: product)
            }
        }
        .padding(.horizontal, 30)
    }
}

#Preview {
    DetailInfoView(product: Product(
        id: "12345",
        name: "iPhone PRO MAX",
        description: "The most recognizable phone. When did cell phones first appear in movies? The first appearance of a mobile phone in a movie was in the 1987 film Wall Street in the form of a Motorola DynaTAC 8000x. When commercial mobile phones launched in 1983, only the ultra-wealthy could afford the hefty price tag of $3,995 (or nearly $12,600 in today’s dollars). This created an initial association with status and greed for the colloquial “brick phone.”",
        image: "https://firebasestorage.googleapis.com/v0/b/onlineshop-809e7.firebasestorage.app/o/products%2F5.webp?alt=media&token=a00e7ed7-53fa-4a16-884d-e9f527ed83aa",
        price: 999,
        isFavorite: false,
        quantityInCart: nil
    ))
    .environmentObject(ViewModel())
}
