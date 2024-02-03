//
//  ExploreViewModel.swift
//  Airbnb
//
//  Created by Игорь Михайлов on 07.01.2024.
//

import Foundation

@MainActor
class ExploreViewModel: ObservableObject {
    private let service: ExploreService
    
    var listings = [Listing]()
    
    @Published var destination = ""
    @Published var filteredListings = [Listing]()
    
    init(service: ExploreService) {
        self.service = service
        
        fetchListings()
    }
    
    func fetchListings() {
        Task {
            do {
                listings = try await service.fetchListings()
                filteredListings = listings
            } catch {
                print("DEBUG: Failed to fetch listings due to error: \(error.localizedDescription)")
            }
        }
    }
    
    func updateListingsLocation() {
        filteredListings = destination.isEmpty ? listings : listings.filter {
            $0.city.localizedCaseInsensitiveContains(destination) ||
            $0.state.localizedCaseInsensitiveContains(destination)
        }
    }
}
