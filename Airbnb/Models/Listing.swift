//
//  Listing.swift
//  Airbnb
//
//  Created by Игорь Михайлов on 07.01.2024.
//

import Foundation

struct Listing: Identifiable, Codable, Hashable {
    let id: String
    let ownerId: String
    let ownerName: String
    let ownerImageUrl: String
    let numberOfBedrooms: Int
    let numberOfBathrooms: Int
    let maxNumberOfGuests: Int
    let numberOfBeds: Int
    let pricePerNight: Int
    let latitude: Double
    let longitude: Double
    let address: String
    let city: String
    let state: String
    let title: String
    let rating: Double
    let features: [ListingFeature]
    let amenities: [ListingAmenity]
    let type: ListingType
    let imageUrls: [String]
}

enum ListingFeature: Int, Codable, Identifiable, Hashable {
    case selfCheckIn, superHost
    
    var id: Int { self.rawValue }
    
    var title: String {
        switch self {
        case .selfCheckIn:
            return "Self check-in"
        case .superHost:
            return "Superhost"
        }
    }
    
    var subtitle: String {
        switch self {
        case .selfCheckIn:
            return "Check yourself in with the keypad."
        case .superHost:
            return "Superhosts are experienced, highly rated hosts who are committed to providing great stars for guests."
        }
    }
    
    var systemImage: String {
        switch self {
        case .selfCheckIn:
            return "door.left.hand.open"
        case .superHost:
            return "medal"
        }
    }
}

enum ListingAmenity: Int, Codable, Identifiable, Hashable {
    case pool, kitchen, wifi, laundry, tv, alarmSystem, office, balcony
    
    var id: Int { self.rawValue }
    
    var title: String {
        switch self {
        case .pool:
            return "Pool"
        case .kitchen:
            return "Kitchen"
        case .wifi:
            return "Wifi"
        case .laundry:
            return "Laundry"
        case .tv:
            return "TV"
        case .alarmSystem:
            return "Alarm System"
        case .office:
            return "Office"
        case .balcony:
            return "Balcony"
        }
    }
    
    var systemImage: String {
        switch self {
        case .pool:
            return "figure.pool.swim"
        case .kitchen:
            return "fork.knife"
        case .wifi:
            return "wifi"
        case .laundry:
            return "washer"
        case .tv:
            return "tv"
        case .alarmSystem:
            return "checkerboard.shield"
        case .office:
            return "pencil.and.ruler.fill"
        case .balcony:
            return "building"
        }
    }
}

enum ListingType: Int, Codable, Identifiable, Hashable {
    case apartment, house, townHouse, villa
    
    var id: Int { self.rawValue }
    
    var description: String {
        switch self {
        case .apartment:
            return "Apartment"
        case .house:
            return "House"
        case .townHouse:
            return "Town House"
        case .villa:
            return "Villa"
        }
    }
}
