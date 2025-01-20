
import SwiftUI

struct CustomRemoteControlButton: View {

    // MARK: - Properties
    let image: String
    let action: () -> Void

    // MARK: - Body
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "minus.rectangle.fill")
                .foregroundStyle(.primary)
                .font(.title)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    CustomRemoteControlButton(image: "minus.rectangle.fill", action: {})
}
