//
//  ListingView.swift
//  Airbnb
//
//  Created by Игорь Михайлов on 07.01.2024.
//

import SwiftUI

struct ListingView: View {
    
    let listing: Listing
    
    var body: some View {
        VStack(spacing: 8) {
            ListingTabView(images: listing.imageUrls)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack(alignment: .top) {
                ListingShortDetailsView(listing: listing)
                Spacer()
                ListingRatingView(listing: listing)
            }
            .font(.footnote)
        }
    }
}

#Preview {
    ListingView(listing: MockData.listings[0])
}

struct ListingShortDetailsView: View {
    
    let listing: Listing
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(listing.city), \(listing.state)")
                .fontWeight(.semibold)
            
            Text("12 mi away")
                .foregroundStyle(.gray)
            
            Text("Nov 3 - 10")
                .foregroundStyle(.gray)
            
            Text("$\(listing.pricePerNight)")
                .fontWeight(.semibold)
            +
            Text(" night")
        }
    }
}

struct ListingRatingView: View {
    
    let listing: Listing
    
    var body: some View {
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
            Text(listing.rating.formatted())
        }
    }
}
