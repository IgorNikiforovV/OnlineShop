//
//  MainView.swift
//  OnlineShop
//
//  Created by Игорь Никифоров on 06.01.2025.
//

import SwiftUI
import FirebaseFirestore

struct MainView: View {

    @FirestoreQuery(collectionPath: "shop") var items: [Product]

    var body: some View {
        List {
            ForEach(items) { item in
                Text(item.name)
            }
        }
    }
}

#Preview {
    MainView()
}
