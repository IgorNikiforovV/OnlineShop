
import SwiftUI

struct FavoriteButton: View {

    //MARK: - Body
    var body: some View {
        Image(systemName: Const.Image.heart)
            .font(.title2)    }
}

#Preview {
    FavoriteButton()
}
