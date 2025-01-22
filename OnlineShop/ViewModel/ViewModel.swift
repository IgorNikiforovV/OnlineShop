
import Foundation
import FirebaseFirestore

final class ViewModel: ObservableObject {

    // MARK: - Properties
    private let db = Firestore.firestore().collection(Const.DB.path)
    @Published var cartItems: [Product] = []

    var cartItemCount: Int {
        cartItems.filter { $0.quantityInCart ?? 0 > 0 }.count
    }

    var totalPrice: Int {
        cartItems.reduce(0) { $0 + (Int($1.price) * ($1.quantityInCart ?? 0)) }
    }

    // MARK: - Initializer
    init() {
        fetchItems()
    }

    // MARK: - Methods

    private func fetchItems() {
        db.addSnapshotListener { snapshot, error in
            guard let document = snapshot?.documents else {
                print("Error fetching documents: \(error?.localizedDescription ?? "unknown error")")
                return
            }

            self.cartItems = document.compactMap { document -> Product? in
                try? document.data(as: Product.self)
            }
        }
    }

    func toggleFavorite(product: Product) {
        updateItem(product: product, data: [Const.DB.isFavorite: !product.isFavorite])
    }

    func addToCatr(product: Product) {
        updateItem(product: product, data: [Const.DB.quantityInCart: 1])
    }

    func removeFromCart(product: Product) {
        updateItem(product: product, data: [Const.DB.quantityInCart: 0])
    }

    func increaseQuantity(product: Product) {
        let quantity = (product.quantityInCart ?? 0) + 1
        updateItem(product: product, data: [Const.DB.quantityInCart: quantity])
    }

    func decreaseQuantity(product: Product) {
        let quantity = (product.quantityInCart ?? 0) - 1
        if quantity >= 1 {
            updateItem(product: product, data: [Const.DB.quantityInCart: quantity])
        }
    }

    private func updateItem(product: Product, data: [String: Any]) {
        guard let id = product.id else { return }
        db.document(id).updateData(data)
    }
}
