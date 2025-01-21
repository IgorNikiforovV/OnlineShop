
import SwiftUI
import FirebaseFirestore

// MARK: - Nested types
extension CartView {
    enum Const {
        enum db {
            static var path: String { "shop" }
        }
        enum navigation {
            static var title: String { "Cart" }
        }
        enum title {
            static var total: String { "Total:" }
            static var buy: String { "Buy:" }
        }
        enum product {
            static var favorite: String { "isFavorite" }
        }
    }
}

struct CartView: View {

    // MARK: - Properties
    @EnvironmentObject var viewModel: ViewModel
    @FirestoreQuery(collectionPath: Const.db.path) private var items: [Product]
    let hPadding: CGFloat = 30

    // MARK: - Body
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(items.filter { ($0.quantityInCart ?? 0) > 0 }) { item in
                    ProductRow(product: item)
                }
            }

            Text("\(Const.title.total) \(viewModel.totalPrice)")
                .titleFont
                .padding(.bottom)
            CustomMainButton(title: Const.title.buy) {}
                .padding(.horizontal, hPadding)
        }
        .navigationTitle(Const.navigation.title)
        .background(.secondary.opacity(0.3))
    }
}

#Preview {
    CartView()
        .environmentObject(ViewModel())
}
