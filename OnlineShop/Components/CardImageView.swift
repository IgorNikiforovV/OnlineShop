
import SwiftUI
import FirebaseFirestore

struct CardImageView: View {
    // MARK: - Properties
    let url: URL
    let size: CGSize

    // MARK: - Body
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: size.width, height: size.height)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        } placeholder: {
            ProgressView()
                .frame(width: size.width, height: size.height)
        }
    }
}

#Preview {
    CardImageView(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/onlineshop-809e7.firebasestorage.app/o/products%2F5.webp?alt=media&token=a00e7ed7-53fa-4a16-884d-e9f527ed83aa")!, size: UIScreen.main.bounds.size)
}
