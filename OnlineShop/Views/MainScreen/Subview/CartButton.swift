
import SwiftUI

// MARK: - Nested types
extension CartButton {
    enum Const {
        static var image: String { "cart.fill" }
    }
}

struct CartButton: View {

    // MARK: - Properties
    var numberOfProducts: Int
    let badgeSize: CGFloat = 17

    // MARK: - Body
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: Const.image)
                .font(.title2)
                .padding(.top, 5)

            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.callout).bold()
                    .foregroundStyle(.white)
                    .frame(width: badgeSize, height: badgeSize)
                    .background(.red)
                    .clipShape(Circle())
            }
        }
    }
}

#Preview {
    CartButton(numberOfProducts: 3)
}
