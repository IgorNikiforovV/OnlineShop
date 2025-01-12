//
//  MainView.swift
//  OnlineShop
//
//  Created by Игорь Никифоров on 06.01.2025.
//

import SwiftUI
import FirebaseFirestore

struct MainView: View {

    // MARK: - Properties
    @FirestoreQuery(collectionPath: "shop") var items: [Product]
    @EnvironmentObject var viewModel: ViewModel

    let columns = Array(repeating: GridItem(), count: 2)

    // MARK - Body
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(items) { item in
                        ProductCardView(product: item)
                    }
                }
            }
            .padding(.horizontal, 10)
            .background(.secondary.opacity(0.3))
            .shadow(color: .black.opacity(0.2) , radius: 8, x: 5, y: 8)

            // MARK: - Navigation Bar
            .navigationTitle("Products")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: FavoritesView()) {
                        Image(systemName: "heart.fill")
                            .font(.title2)
                    }
                    .buttonStyle(.plain)
                }

                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: CartView()) {
                        Image(systemName: "cart.fill")
                            .font(.title2)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(ViewModel())
}
