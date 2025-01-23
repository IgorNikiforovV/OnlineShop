
import FirebaseFirestore

struct Product: Identifiable, Codable {
    @DocumentID var id: String?
    let name: String
    let description: String
    let image: String
    let price: Double
    let isFavorite: Bool
    let quantityInCart: Int?

    var textPrice: String {
        let decimal = price.truncatingRemainder(dividingBy: 1)
        if decimal == 0 {
            return "\(Int(price))"
        } else {
            return String(format: "%.2f", price)
        }
    }
}
