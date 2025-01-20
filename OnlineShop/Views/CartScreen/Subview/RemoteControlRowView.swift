
import SwiftUI

struct RemoteControlRowView: View {

    // MARK: - Properties
    let product: Product
    @EnvironmentObject var viewModel: ViewModel
    let spacing: CGFloat = 25

    // MARK: - Body
    var body: some View {
        VStack(alignment: .trailing, spacing: spacing) {

            // MARK: Remove button
            CustomRemoteControlButton(image: "xmark.circle.fill") {
                viewModel.removeFromCart(product: product)
            }

            HStack {
                // MARK: Decrease
                CustomRemoteControlButton(image: "minus.rectangle.fill") {
                    viewModel.decreaseQuantity(product: product)
                }

                // MARK: - Quantity
                if let quantityInCart = product.quantityInCart {
                    Text("\(quantityInCart)")
                        .titleFont
                }
                
                // MARK: - Increase
                CustomRemoteControlButton(image: "plus.rectangle.fill") {
                    viewModel.increaseQuantity(product: product)
                }
            }

        }
        .padding()
    }
}

#Preview {
    ProductRow(product: Product(
        id: "12345",
        name: "iPhone PRO MAX",
        description: "The most recognizable phone. When did cell phones first appear in movies? The first appearance of a mobile phone in a movie was in the 1987 film Wall Street in the form of a Motorola DynaTAC 8000x. When commercial mobile phones launched in 1983, only the ultra-wealthy could afford the hefty price tag of $3,995 (or nearly $12,600 in today’s dollars). This created an initial association with status and greed for the colloquial “brick phone.”",
        image: "https://firebasestorage.googleapis.com/v0/b/onlineshop-809e7.firebasestorage.app/o/products%2F5.webp?alt=media&token=a00e7ed7-53fa-4a16-884d-e9f527ed83aa",
        price: 999,
        isFavorite: false,
        quantityInCart: 5
    ))
}
