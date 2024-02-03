//
//  AuthViewModel.swift
//  Airbnb
//
//  Created by Игорь Михайлов on 08.01.2024.
//

import Foundation

@MainActor
class AuthViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    
    @Published var currentUserId = FirebaseConstants.auth.currentUser?.uid
    @Published var showingLoginView = false
    
    @Published var showingError = false
    @Published var errorMessage = ""
    
    private let service: AuthService
    
    var isLoginFormValid: Bool {
        email.contains("@") &&
        password.count > 5
    }
    
    init(service: AuthService) {
        self.service = service
    }
    
    func login() {
        Task {
            do {
                currentUserId = try await service.login(email: email, password: password)
                showingLoginView = false
            } catch {
                errorMessage = "Failed to login due to error: \(error.localizedDescription)"
                showingError = true
            }
        }
    }
    
    func createUser() {
        Task {
            do {
                currentUserId = try await service.createUser(email: email, password: password, fullName: fullName)
                showingLoginView = false
            } catch {
                errorMessage = "Failed to create user due to error: \(error.localizedDescription)"
                showingError = true
            }
        }
    }
    
    func logout() {
        service.logout()
        currentUserId = nil
    }
}
