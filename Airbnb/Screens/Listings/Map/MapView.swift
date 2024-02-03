//
//  MapView.swift
//  Airbnb
//
//  Created by Игорь Михайлов on 07.01.2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Environment(\.dismiss) var dismiss
    
    private let listings: [Listing]
    @State private var cameraPosition: MapCameraPosition
    @State private var selectedListing: Listing?
    
    @State private var showingDetails = false
    
    init(listings: [Listing], center: CLLocationCoordinate2D) {
        self.listings = listings
        
        let coordinateRegion = MKCoordinateRegion(
            center: center,
            latitudinalMeters: 50000,
            longitudinalMeters: 50000
        )
        _cameraPosition = State(initialValue: .region(coordinateRegion))
    }
    
    var body: some View {
        Map(position: $cameraPosition, selection: $selectedListing.animation()) {
            ForEach(listings, id: \.self) { listing in
                Marker("", coordinate: CLLocationCoordinate2D(
                    latitude: listing.latitude,
                    longitude: listing.longitude
                ))
            }
        }
        .overlay(alignment: .topLeading) {
            Button {
                dismiss()
            } label: {
                BackButton()
            }
            .padding(25)
            .ignoresSafeArea()
        }
        .overlay(alignment: .bottom) {
            if let selectedListing {
                Button {
                    showingDetails = true
                } label: {
                    ListingPreview(listing: selectedListing)
                }
                .tint(.primary)
            }
        }
        .fullScreenCover(isPresented: $showingDetails) {
            ListingDetailsView(listing: selectedListing!)
        }
    }
}

#Preview {
    MapView(listings: MockData.listings, center: CLLocationCoordinate2D())
}
