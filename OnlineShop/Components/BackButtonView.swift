//
//  BackButtonView.swift
//  OnlineShop
//
//  Created by Игорь Никифоров on 15.01.2025.
//

import SwiftUI

struct BackButtonView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button {
            dismiss()
        } label: {
            ZStack {
                Circle()
                    .frame(width: 34)
                    .foregroundColor(.black.opacity(0.3))
                    .opacity(0.3)
                Image(systemName: "chevron.left")
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
