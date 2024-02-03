//
//  ContentView.swift
//  Airbnb
//
//  Created by Игорь Михайлов on 06.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var authViewModel = AuthViewModel(service: FirebaseAuthService())
    
    var body: some View {
        MainTabView()
            .preferredColorScheme(.light)
            .environmentObject(authViewModel)
    }
}

#Preview {
    ContentView()
}
