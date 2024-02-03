//
//  ProfileView.swift
//  Airbnb
//
//  Created by Игорь Михайлов on 07.01.2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authModel: AuthViewModel
    
    var body: some View {
        VStack {
            if authModel.currentUserId != nil {
                ProfileHeader()
                    .padding(.vertical)
            } else {
                ProfileLoginView(onPress: { authModel.showingLoginView = true })
            }
            
            VStack(spacing: 24) {
                ProfileOptionRowView(image: "gear", title: "Settings")
                ProfileOptionRowView(image: "gear", title: "Accessibility")
                ProfileOptionRowView(image: "questionmark.circle", title: "Visit the help center")
            }
            .padding(.vertical)
            
            Button {
                authModel.logout()
            } label: {
                Text("Log Out")
            }
        }
        .padding()
        .sheet(isPresented: $authModel.showingLoginView) {
            LoginView()
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel(service: FirebaseAuthService()))
}

struct ProfileOptionRowView: View {
    let image: String
    let title: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: image)
                
                Text(title)
                    .font(.subheadline)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            
            Divider()
        }
    }
}

struct ProfileLoginView: View {
    
    let onPress: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Log in to start planning your next trip")
            }
            
            Button {
                onPress()
            } label: {
                Text("Log In")
                    .authButtonStyle()
            }
            
            HStack {
                Text("Don't have an account? ")
                +
                Text("Sign up")
                    .fontWeight(.semibold)
                    .underline()
            }
            .font(.caption)
        }
    }
}


