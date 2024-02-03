//
//  ListingTabView.swift
//  Airbnb
//
//  Created by Игорь Михайлов on 07.01.2024.
//

import SwiftUI

struct ListingTabView: View {
    
    let images: [String]
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }        
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingTabView(images: MockData.images)
}
