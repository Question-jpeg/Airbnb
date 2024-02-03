//
//  AuthService.swift
//  Airbnb
//
//  Created by Игорь Михайлов on 08.01.2024.
//

import Foundation

protocol AuthService {
    func login(email: String, password: String) async throws -> String
    
    func createUser(email: String, password: String, fullName: String) async throws -> String
    
    func logout()
}
