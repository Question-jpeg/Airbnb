//
//  ExploreService.swift
//  Airbnb
//
//  Created by Игорь Михайлов on 07.01.2024.
//

import Foundation

struct ExploreService {
    func fetchListings() async throws -> [Listing] {
        MockData.listings
    }
}
