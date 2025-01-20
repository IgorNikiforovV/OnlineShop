
import SwiftUI
import FirebaseFirestore


struct CartView: View {

    // MARK: - Properties
    @EnvironmentObject var viewModel: ViewModel
    @FirestoreQuery(collectionPath: "shop") private var items: [Product]
    let hPadding: CGFloat = 30

    // MARK: - Body
    var body: some View {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(items.filter { ($0.quantityInCart ?? 0) > 0 }) { item in
                        ProductRow(product: item)
                    }
                }

                Text("Total: \(viewModel.totalPrice)")
                    .titleFont
                    .padding(.bottom)
                CustomMainButton(title: "Buy") {}
                .padding(.horizontal, hPadding)
            }
        .navigationTitle("Cart")
        .background(.secondary.opacity(0.3))
    }
}

#Preview {
    CartView()
        .environmentObject(ViewModel())
}
