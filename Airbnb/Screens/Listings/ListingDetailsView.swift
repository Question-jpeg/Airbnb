//
//  ListingDetailsView.swift
//  Airbnb
//
//  Created by Игорь Михайлов on 07.01.2024.
//

import SwiftUI
import MapKit

struct ListingDetailsView: View {
    @Environment(\.dismiss) var dismiss
    let listing: Listing
    @State private var cameraPosition: MapCameraPosition
    
    init(listing: Listing) {
        self.listing = listing
        
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: listing.latitude,
                longitude: listing.longitude
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.1,
                longitudeDelta: 0.1
            )
        )
        _cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        ScrollView {
            ListingTabView(images: listing.imageUrls)
                .frame(height: 320)
                
            VStack(spacing: 16) {
                ListingShortInfoView(listing: listing)
                Divider()
                ListingHostInfoView(listing: listing)
                Divider()
                ListingFeaturesView(listing: listing)
                Divider()
            }
            .padding(.horizontal)
            
            ListingBedroomsView(listing: listing)
                .padding(.vertical, 16)
            
            VStack(spacing: 16) {
                Divider()
                AmenitiesView(listing: listing)
                Divider()
                ListingMapView(cameraPosition: $cameraPosition, listing: listing)
            }
            .padding(.horizontal)
            .padding(.bottom, 140)
        }
        .ignoresSafeArea()
        .scrollIndicators(.hidden)
        .overlay(alignment: .bottom) {
            ListingReserveBar(listing: listing)
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
    }
}

#Preview {
    ListingDetailsView(listing: MockData.listings[4])
}

struct ListingShortInfoView: View {
    
    let listing: Listing
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(listing.title)
                .font(.title)
                .fontWeight(.semibold)
            
            VStack(alignment: .leading) {
                HStack(spacing: 4) {
                    ListingRatingView(listing: listing)
                    
                    Text("-")
                    
                    Text("28 reviews")
                        .underline()
                        .fontWeight(.semibold)
                }
                Text("\(listing.city), \(listing.state)")
            }
            .font(.caption)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ListingHostInfoView: View {
    
    let listing: Listing
    
    var body: some View {
        HStack {
            VStack(alignment:. leading) {
                Text("Entire \(listing.type.description) hosted by\n\(listing.ownerName)")
                    .font(.headline)
                
                Text("\(listing.maxNumberOfGuests) guests - \(listing.numberOfBedrooms) bedrooms - \(listing.numberOfBeds) beds - \(listing.numberOfBathrooms) baths")
                    .font(.caption)
            }
            
            Spacer()
            
            Image(listing.ownerImageUrl)
                .avatarStyle(size: 64)
        }
    }
}

struct ListingFeaturesView: View {
    
    let listing: Listing
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(listing.features) { feature in
                ListingFeatureView(feature: feature)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ListingFeatureView: View {
    
    let feature: ListingFeature
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: feature.systemImage)
            
            VStack(alignment: .leading) {
                Text(feature.title)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text(feature.subtitle)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
    }
}

struct ListingBedroomsView: View {
    
    let listing: Listing
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Where you'll sleep")
                .font(.headline)
                .padding(.horizontal)
            
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(1...listing.numberOfBedrooms, id: \.self) { bedroom in
                        VStack(alignment: .leading, spacing: 5) {
                            Image(systemName: "bed.double")
                            
                            Text("Bedroom \(bedroom)")
                                .font(.caption)
                        }
                        .padding(.horizontal)
                        .frame(width: 132, height: 100, alignment: .leading)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 1)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .scrollTargetBehavior(.paging)
            .scrollIndicators(.hidden)
        }
    }
}

struct AmenitiesView: View {
    
    let listing: Listing
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("What this place offers")
                .font(.headline)
            
            ForEach(listing.amenities) { amenity in
                AmenityView(amenity: amenity)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct AmenityView: View {
    
    let amenity: ListingAmenity
    
    var body: some View {
        HStack {
            Image(systemName: amenity.systemImage)
                .frame(width: 32)
            
            Text(amenity.title)
                .font(.footnote)
        }
    }
}

struct ListingReserveBar: View {
    
    let listing: Listing
    
    var body: some View {
        VStack {
            Divider()
                .padding(.bottom, 5)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("$\(listing.pricePerNight)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Text("Total before taxes")
                        .font(.footnote)
                    
                    Text("Oct 15 - 20")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .underline()
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Reserve")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 140, height: 40)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding(.horizontal, 32)
        }
        .background(.white)
    }
}

struct ListingMapView: View {
    
    @Binding var cameraPosition: MapCameraPosition
    let listing: Listing
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Where you'll be")
                .font(.headline)
            
            Map(position: $cameraPosition) {
                Marker("", coordinate: CLLocationCoordinate2D(
                    latitude: listing.latitude,
                    longitude: listing.longitude)
                )
            }
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

struct BackButton: View {
    var body: some View {
        Circle()
            .fill(.white)
            .frame(width: 36, height: 36)
            .overlay {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.black)
            }
    }
}
