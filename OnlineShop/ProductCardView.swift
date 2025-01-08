//
//  ProductCardView.swift
//  OnlineShop
//
//  Created by Игорь Никифоров on 08.01.2025.
//

import SwiftUI

struct ProductCardView: View {
    var body: some View {
        GeometryReader { geo in
            let size = geo.size
        }
        .frame(height: UIScreen.main.bounds.width * 0.5)
        .background(.green)
    }
}

#Preview {
    ProductCardView()
}
