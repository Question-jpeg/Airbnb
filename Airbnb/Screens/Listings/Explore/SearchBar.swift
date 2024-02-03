//
//  SearchBar.swift
//  Airbnb
//
//  Created by Игорь Михайлов on 07.01.2024.
//

import SwiftUI

struct SearchBar: View {
    
    @ObservedObject var viewModel: ExploreViewModel
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            VStack(alignment: .leading, spacing: 2) {
                Text(viewModel.destination.isEmpty ? "Where to?" : viewModel.destination)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("Any Week - Add guests")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay {
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: .black.opacity(0.4), radius: 2)
        }
    }
}

#Preview {
    SearchBar(viewModel: ExploreViewModel(service: ExploreService()))
}
