
import SwiftUI

struct BackButtonView: View {

    // MARK: - Properties
    @Environment(\.dismiss) var dismiss

    // MARK: - Body
    var body: some View {
        Button {
            dismiss()
        } label: {
            ZStack {
                Circle()
                    .frame(width: 34)
                    .foregroundColor(.black.opacity(0.3))
                    .opacity(0.3)
                Image(systemName: Const.Image.chevron)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                    .opacity(0.8)
            }
        }

    }
}

#Preview {
    BackButtonView()
}
