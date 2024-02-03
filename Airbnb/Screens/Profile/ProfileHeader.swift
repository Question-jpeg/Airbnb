//
//  ProfileHeader.swift
//  Airbnb
//
//  Created by Игорь Михайлов on 08.01.2024.
//

import SwiftUI

struct ProfileHeader: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 28)
            .fill(.white)
            .frame(width: 300, height: 200)
            .shadow(radius: 10)
            .overlay(alignment: .center) {
                VStack {
                    Image(.maleProfilePhoto)
                        .avatarStyle(size: 80)
                    
                    Text("John Doe")
                        .font(.headline)
                    
                    Text("Guest")
                        .font(.footnote)
                }
            }
    }
}

#Preview {
    ProfileHeader()
}
