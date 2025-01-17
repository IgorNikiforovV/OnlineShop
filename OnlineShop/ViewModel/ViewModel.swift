//
//  ViewModel.swift
//  OnlineShop
//
//  Created by Игорь Никифоров on 12.01.2025.
//

import Foundation
import FirebaseFirestore

final class ViewModel: ObservableObject {

    // MARK: - Properties
    private let db = Firestore.firestore().collection("shop")

    // MARK: - Methods
    func toggleFavorite(product: Product) {
        updateItem(product: product, data: ["isFavorite": !product.isFavorite])
    }

    func addToCatr(product: Product) {
        updateItem(product: product, data: ["quantityInCart": 1])
    }

    func removeFromCart(product: Product) {
        updateItem(product: product, data: ["quantityInCart": 0])
    }

    private func updateItem(product: Product, data: [String: Any]) {
        guard let id = product.id else { return }
        db.document(id).updateData(data)
    }
}
