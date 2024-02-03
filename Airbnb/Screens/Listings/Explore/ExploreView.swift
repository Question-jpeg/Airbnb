//
//  ExploreView.swift
//  Airbnb
//
//  Created by Игорь Михайлов on 07.01.2024.
//

import SwiftUI
import MapKit

struct ExploreView: View {
    @State private var showingDestinationSearchView = false
    @State private var toolbarVisible = true
    @State private var showingMap = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack {
            if showingDestinationSearchView {
                DestinationSearchView(showing: $showingDestinationSearchView, viewModel: viewModel)
            } else {
                ScrollView {
                    LazyVStack(spacing: 32) {
                        Button {
                            showingDestinationSearchView = true
                        } label: {
                            SearchBar(viewModel: viewModel)
                        }
                        .tint(.black)
                        
                        ForEach(viewModel.filteredListings, id: \.self) { listing in
                            NavigationLink(value: listing) {
                                ListingView(listing: listing)
                            }
                            .tint(.primary)
                        }
                    }
                    .padding()
                }
                .toolbar(toolbarVisible ? .automatic : .hidden, for: .tabBar)
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailsView(listing: listing)
                        .navigationBarBackButtonHidden()
                        .toolbar(toolbarVisible ? .automatic : .hidden, for: .tabBar)
                        .onAppear {
                            withAnimation(.snappy) {
                                toolbarVisible = false
                            }
                        }
                }
                .overlay(alignment: .bottom) {
                    Button {
                        showingMap = true
                    } label: {
                        MapButton()
                    }
                }
                .onAppear { toolbarVisible = true }
                .sheet(isPresented: $showingMap) {
                    MapView(
                        listings: viewModel.filteredListings,
                        center: CLLocationCoordinate2D(
                            latitude: viewModel.filteredListings[0].latitude,
                            longitude: viewModel.filteredListings[0].longitude
                        )
                    )
                }
            }
        }
        .animation(.snappy, value: showingDestinationSearchView)
    }
}

#Preview {
    ExploreView()
}

struct MapButton: View {
    var body: some View {
        HStack {
            Text("Map")
            Image(systemName: "paperplane")
        }
        .foregroundStyle(.white)
        .padding(.vertical, 12)
        .padding(.horizontal)
        .background(.black)
        .clipShape(Capsule())
        .padding()
        
    }
}
