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
    @FirestoreQuery(collectionPath: "shop", predicates: [.isEqualTo("isFavorite", true)]) var favoriteItems: [Product]
    var columns = Array(repeating: GridItem(), count: 2)
    @EnvironmentObject var viewModel: ViewModel

    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(favoriteItems) { item in
                    NavigationLink(destination: EmptyView()) {
                        ProductCardView(product: item)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding(.horizontal, 10)
        .background(.secondary.opacity(0.3))
        .navigationTitle("Favorites")
    }
}

#Preview {
    FavoritesView()
        .environmentObject(ViewModel())
}
