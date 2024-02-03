//
//  WishlistEmpyView.swift
//  Airbnb
//
//  Created by Игорь Михайлов on 08.01.2024.
//

import SwiftUI

struct WishlistEmptyView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Create your first wishlist")
                .font(.headline)
            
            Text("As you explore, tap the heart icon to save your favorite places to a wishlist")
        }
        .padding()
    }
}

#Preview {
    WishlistEmptyView()
}
