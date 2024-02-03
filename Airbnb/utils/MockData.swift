//
//  mockData.swift
//  Airbnb
//
//  Created by Игорь Михайлов on 07.01.2024.
//

import Foundation

struct MockData {
    static let images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4",
    ]
    
    static let personImage = "male-profile-photo"
    
    static let listings: [Listing] = [
        .init(
            id: UUID().uuidString,
            ownerId: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageUrl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            maxNumberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7850,
            longitude: -80.1936,
            address: "124 Main St",
            city: "Miami",
            state: "Florida",
            title: "Miami Villa", 
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa,
            imageUrls: ["listing-2", "listing-1", "listing-3", "listing-4"]
        ),
        .init(
            id: UUID().uuidString,
            ownerId: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageUrl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            maxNumberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7706,
            longitude: -80.1340,
            address: "124 Main St",
            city: "Miami",
            state: "Florida",
            title: "Miami Beach House", 
            rating: 4.74,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .tv, .kitchen, .office],
            type: .house,
            imageUrls: ["listing-3", "listing-1", "listing-2", "listing-4"]
        ),
        .init(
            id: UUID().uuidString,
            ownerId: NSUUID().uuidString,
            ownerName: "Steve Johnson",
            ownerImageUrl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            maxNumberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 763,
            latitude: 25.7650,
            longitude: -80.1936,
            address: "124 Main St",
            city: "Miami",
            state: "Florida",
            title: "Beatiful Miami apartment in downtown Brickell", 
            rating: 4.99,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony],
            type: .apartment,
            imageUrls: ["listing-1", "listing-2", "listing-3", "listing-4"]
        ),
        .init(
            id: UUID().uuidString,
            ownerId: NSUUID().uuidString,
            ownerName: "Harry Styles",
            ownerImageUrl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            maxNumberOfGuests: 4,
            numberOfBeds: 4, 
            pricePerNight: 763,
            latitude: 34.2,
            longitude: -118.0426,
            address: "124 Main St",
            city: "Los Angeles",
            state: "California",
            title: "Beatiful Los Angeles home in Malibu", 
            rating: 4.58,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .pool],
            type: .apartment,
            imageUrls: ["listing-4", "listing-1", "listing-3", "listing-2"]
        ),
        .init(
            id: UUID().uuidString,
            ownerId: NSUUID().uuidString,
            ownerName: "Timothy Chalamet",
            ownerImageUrl: "male-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            maxNumberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 763,
            latitude: 34.1,
            longitude: -118.1426,
            address: "124 Main St",
            city: "Los Angeles",
            state: "California",
            title: "Beatiful Los Angeles home in the Hollywood Hills", 
            rating: 4.51,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony],
            type: .apartment,
            imageUrls: ["listing-5", "listing-1", "listing-3", "listing-4"]
        ),
    ]
}

struct MockAuthService: AuthService {
    func login(email: String, password: String) async throws -> String {
        UUID().uuidString
    }
    
    func createUser(email: String, password: String, fullName: String) async throws -> String {
        UUID().uuidString
    }
    
    func logout() {
        
    }
}
