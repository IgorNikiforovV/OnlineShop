
import SwiftUI

// MARK: - Nested types
extension ProductCardView {
    enum Const {
        static var image: String { "heart.fill" }
    }
}

struct ProductCardView: View {

    // MARK: - Properties
    let product : Product
    @EnvironmentObject
    var viewModel: ViewModel
    let padding6: CGFloat = 6
    let padding8: CGFloat = 8
    let padding10: CGFloat = 10
    let cellHeight = UIScreen.main.bounds.width * 0.7

    // MARK: - Body
    var body: some View {
        GeometryReader { geo in
            let size = geo.size

            ZStack(alignment: .bottom) {
                ZStack(alignment: .topTrailing) {
                    if let url = URL(string: product.image) {
                        CardImageView(url: url, size: size)
                        Button {
                            viewModel.toggleFavorite(product: product)
                        } label: {
                            Image(systemName: Const.image)
                                .padding(padding6)
                                .foregroundColor(product.isFavorite ? .red : .white)
                                .background(.black)
                                .clipShape(Circle())
                                .padding(padding6)
                        }

                    }
                }

                VStack(alignment: .leading) {
                    Text(product.name)
                        .titleFont
                        .lineLimit(1)
                    Text("$\(product.textPrice)")
                        .subtitleFont
                }
                .padding(padding10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.opacity(0.5))
                .cornerRadius(20)
                .padding(padding8)
                .shadow(radius: 10, y: 8)
            }

        }
        .frame(height: cellHeight)
        .cornerRadius(10)
    }
}

#Preview {
    MainView()
        .environmentObject(ViewModel())
//    ProductCardView(
//        product: Product(
//            id: "12345",
//            name: "iPhone PRO MAX",
//            description: "The most recognizable phone",
//            image: "https://firebasestorage.googleapis.com/v0/b/onlineshop-809e7.firebasestorage.app/o/products%2F5.webp?alt=media&token=a00e7ed7-53fa-4a16-884d-e9f527ed83aa",
//            price: 999,
//            isFavorite: false,
//            quantityInCart: nil
//        )
//    )
//    .environmentObject(ViewModel())
}
