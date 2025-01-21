
import SwiftUI

extension Text {
    var titleFont: some View {
        self
            .foregroundStyle(.primary)
            .font(.system(size: 18, weight: .bold, design: .rounded))
            .opacity(0.8)
    }

    var subtitleFont: some View {
        self
            .foregroundStyle(.primary)
            .font(.system(size: 15, weight: .regular, design: .rounded))
            .opacity(0.8)
    }
}

struct FontView: View {
    var body: some View {
        VStack {
            Text("Title Font")
                .titleFont
            Text("Subtitle Font")
                .subtitleFont
        }
    }
}

#Preview {
    FontView()
}
