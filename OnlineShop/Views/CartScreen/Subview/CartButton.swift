//
//  CartButton.swift
//  OnlineShop
//
//  Created by Игорь Никифоров on 19.01.2025.
//

import SwiftUI

struct CartButton: View {

    // MARK: - Properties
    var numberOfProducts: Int

    // MARK: - Body
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart.fill")
                .font(.title2)
                .padding(.top, 5)

            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.callout).bold()
                    .foregroundStyle(.white)
                    .frame(width: 17, height: 17)
                    .background(.red)
                    .clipShape(Circle())
            }
        }
    }
}

#Preview {
    CartButton(numberOfProducts: 3)
}
