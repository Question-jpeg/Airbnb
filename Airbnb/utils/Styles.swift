//
//  Styles.swift
//  Airbnb
//
//  Created by Игорь Михайлов on 07.01.2024.
//

import SwiftUI

extension View {
    func floatingCardStyle() -> some View {
        self
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 10)
    }
    
    func textFieldStyle() -> some View {
        self
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    func authButtonStyle() -> some View {
        self
            .foregroundStyle(.white)
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, maxHeight: 48)
            .background(.pink)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

extension Image {
    func avatarStyle(size: CGFloat) -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(width: size, height: size)
            .clipShape(Circle())
    }
}
