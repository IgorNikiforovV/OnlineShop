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
        guard let id = product.id else { return }

        db.document(id).updateData(["isFavorite": !product.isFavorite])
    }
}
