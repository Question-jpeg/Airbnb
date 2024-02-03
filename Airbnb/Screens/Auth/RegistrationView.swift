//
//  RegistrationView.swift
//  Airbnb
//
//  Created by Игорь Михайлов on 08.01.2024.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var isValid: Bool {
        viewModel.isLoginFormValid &&
        !viewModel.fullName.isEmpty
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Image(.airbnbAppIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                    .padding()
                
                VStack {
                    TextField("Enter your email", text: $viewModel.email)
                        .textFieldStyle()
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .textFieldStyle()
                    
                    TextField("Enter your full name", text: $viewModel.fullName)
                        .textFieldStyle()
                }
                
                Button {
                    viewModel.createUser()
                } label: {
                    Text("Create Account")
                        .authButtonStyle()
                }
                .disabled(!isValid)
                .opacity(isValid ? 1 : 0.5)
                .padding(.vertical)
            }
            .padding(.horizontal)
            
            Spacer()
            Divider()
            Button {
                dismiss()
            } label: {
                Text("Already have an account? ")
                +
                Text("Log In")
                    .fontWeight(.semibold)
            }
            .font(.footnote)
            .padding(.vertical)
        }
    }
}

#Preview {
    RegistrationView()
}
