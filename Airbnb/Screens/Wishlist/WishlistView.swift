//
//  WishlistView.swift
//  Airbnb
//
//  Created by Игорь Михайлов on 07.01.2024.
//

import SwiftUI

struct WishlistView: View {
    @EnvironmentObject var authModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("WishList")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.top)
            
            if authModel.currentUserId != nil {
                WishlistEmptyView()
            } else {
                WishlistLoginView()
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .sheet(isPresented: $authModel.showingLoginView) {
            LoginView()
        }
    }
}

#Preview {
    WishlistView()
        .environmentObject(AuthViewModel(service: MockAuthService()))
}

struct WishlistLoginView: View {
    
    @EnvironmentObject var authModel: AuthViewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Log in to view your wishlist")
                    .font(.headline)
                
                Text("You can create, view or edit wishlist once you've logged in")
                    .font(.footnote)
            }
            
            Button {
                authModel.showingLoginView = true
            } label: {
                Text("Log In")
                    .authButtonStyle()
            }
        }
    }
}
