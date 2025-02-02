
import SwiftUI
import FirebaseFirestore

struct MainView: View {

    // MARK: - Properties
    @FirestoreQuery(collectionPath: Const.DB.path) var items: [Product]
    @EnvironmentObject var viewModel: ViewModel

    let columns = Array(repeating: GridItem(), count: 2)
    let hPadding: CGFloat = 10

    // MARK - Body
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(items) { item in
                        NavigationLink {
                            DetailView(product: item)
                        } label: {
                            ProductCardView(product: item)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(.horizontal, hPadding)
            .background(.secondary.opacity(0.3))
            .shadow(color: .black.opacity(0.2) , radius: 8, x: 5, y: 8)

            // MARK: - Navigation Bar
            .navigationTitle(Const.Title.products)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: FavoritesView()) {
                        FavoriteButton()
                    }
                    .buttonStyle(.plain)
                }

                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: CartView()) {
                        CartButton(numberOfProducts: viewModel.cartItemCount)
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
