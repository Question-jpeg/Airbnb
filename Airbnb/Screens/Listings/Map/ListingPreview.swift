//
//  ListingPreview.swift
//  Airbnb
//
//  Created by Игорь Михайлов on 07.01.2024.
//

import SwiftUI

struct ListingPreview: View {        
    let listing: Listing
    
    var body: some View {
        VStack {
            ListingTabView(images: listing.imageUrls)
                .frame(height: 200)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                    
                    Text("7 nights: Dec 12 - 19")
                    
                    Text("$\(listing.pricePerNight)")
                        .fontWeight(.semibold)
                    +
                    Text(" night")                    
                }
                
                Spacer()
                
                ListingRatingView(listing: listing)
            }
            .font(.footnote)
            .padding(8)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
    }
}

#Preview {
    ListingPreview(listing: MockData.listings[0])
}
