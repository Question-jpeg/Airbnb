//
//  LoginView.swift
//  Airbnb
//
//  Created by Игорь Михайлов on 08.01.2024.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var isValid: Bool {
        viewModel.isLoginFormValid
    }
    
    var body: some View {
        NavigationStack {
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
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        Text("Forgot password?")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.top)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                    Button {
                        viewModel.login()
                    } label: {
                        Text("Log In")
                            .authButtonStyle()
                    }
                    .disabled(!isValid)
                    .opacity(isValid ? 1 : 0.5)
                    .padding(.vertical)
                }
                .padding(.horizontal)
                
                Spacer()
                Divider()
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Don't have an account? ")
                    +
                    Text("Sign Up")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .padding(.vertical)
            }
        }
        .alert(viewModel.errorMessage, isPresented: $viewModel.showingError) {}
    }
}

#Preview {
    LoginView()
}
