
import SwiftUI

// MARK: - Nested types
extension FavoriteButton {
    enum Const {
        static var image: String { "heart.fill" }
    }
}

struct FavoriteButton: View {

    //MARK: - Body
    var body: some View {
        Image(systemName: Const.image)
            .font(.title2)    }
}

#Preview {
    FavoriteButton()
}
