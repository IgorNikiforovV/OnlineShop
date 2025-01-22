//
//  FavoritesView.swift
//  OnlineShop
//
//  Created by Игорь Никифоров on 08.01.2025.
//

import SwiftUI
import FirebaseFirestore

struct FavoritesView: View {

    // MARK: - Properties
    @FirestoreQuery(collectionPath: Const.DB.path, predicates: [.isEqualTo(Const.DB.isFavorite, true)]) var favoriteItems: [Product]
    var columns = Array(repeating: GridItem(), count: 2)
    let hPadding: CGFloat = 10

    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(favoriteItems) { item in
                    NavigationLink(destination: DetailView(product: item)) {
                        ProductCardView(product: item)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding(.horizontal, hPadding)
        .background(.secondary.opacity(0.3))
        .navigationTitle(Const.Title.favorites)
    }
}

#Preview {
    FavoritesView()
}
