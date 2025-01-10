//
//  Extension+Text.swift
//  OnlineShop
//
//  Created by Игорь Никифоров on 10.01.2025.
//

import SwiftUI

extension Text {
    var titleFont: some View {
        self
            .foregroundStyle(.primary)
            .font(.system(size: 18, weight: .bold, design: .rounded))
            .opacity(0.8)
    }

    var subtitle: some View {
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
                .subtitle
        }
    }
}

#Preview {
    FontView()
}
