
import SwiftUI
import FirebaseFirestore

// MARK: - Nested types

struct CartView: View {

    // MARK: - Properties
    @EnvironmentObject var viewModel: ViewModel
    @FirestoreQuery(collectionPath: Const.DB.path) private var items: [Product]
    let hPadding: CGFloat = 30

    // MARK: - Body
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(items.filter { ($0.quantityInCart ?? 0) > 0 }) { item in
                    ProductRow(product: item)
                }
            }

            Text("\(Const.Title.total) \(viewModel.totalPrice)")
                .titleFont
                .padding(.bottom)
            CustomMainButton(title: Const.Button.buy) {}
                .padding(.horizontal, hPadding)
        }
        .navigationTitle(Const.Title.cart)
        .background(.secondary.opacity(0.3))
    }
}

#Preview {
    CartView()
        .environmentObject(ViewModel())
}
