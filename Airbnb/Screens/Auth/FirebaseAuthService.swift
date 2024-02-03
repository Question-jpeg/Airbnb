//
//  FirebaseAuthService.swift
//  Airbnb
//
//  Created by Игорь Михайлов on 08.01.2024.
//

import Firebase

struct FirebaseAuthService: AuthService {
    func login(email: String, password: String) async throws -> String {
        let result = try await FirebaseConstants.auth.signIn(withEmail: email, password: password)
        return result.user.uid
    }
    
    func createUser(email: String, password: String, fullName: String) async throws -> String {
        let result = try await FirebaseConstants.auth.createUser(withEmail: email, password: password)
        return result.user.uid
    }
    
    func logout() {
        try? FirebaseConstants.auth.signOut()
    }
}
