//
//  DestinationSearchView.swift
//  Airbnb
//
//  Created by Игорь Михайлов on 07.01.2024.
//

import SwiftUI

enum DestinationSearchOption {
    case destination, dates, guests
}

struct DestinationSearchView: View {
    @Binding var showing: Bool
    @State private var selectedOption = DestinationSearchOption.destination
    
    @State private var countOfGuests = 2
    @State private var fromDate = Date.now
    @State private var toDate = Date.now.addingTimeInterval(86400)
    
    @ObservedObject var viewModel: ExploreViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 36) {
            Button {
                showing = false
                viewModel.updateListingsLocation()
            } label: {
                CloseButton()
            }
            .tint(.black)
            
            CollapsableCardField(
                content: { WhereField(destination: $viewModel.destination) { selectedOption = .dates } },
                isSelected: selectedOption == .destination,
                title: "Where",
                description: "Add Destination",
                onReveal: { selectedOption = .destination }
            )
            
            CollapsableCardField(
                content: { WhenField(from: $fromDate, to: $toDate) },
                isSelected: selectedOption == .dates,
                title: "When",
                description: "Add Dates",
                onReveal: { selectedOption = .dates }
            )
            
            CollapsableCardField(
                content: { WhoField(count: $countOfGuests) },
                isSelected: selectedOption == .guests,
                title: "Who",
                description: "Add Guests",
                onReveal: { selectedOption = .guests }
            )
            
            Spacer()
        }
        .padding(.horizontal)
        .animation(.snappy, value: selectedOption)
    }
}

#Preview {
    DestinationSearchView(showing: .constant(true), viewModel: ExploreViewModel(service: ExploreService()))
}

struct CloseButton: View {
    var body: some View {
        Circle()
            .stroke(lineWidth: 1)
            .foregroundStyle(.gray)
            .frame(width: 25)
            .overlay {
                Image(systemName: "xmark")
                    .imageScale(.small)
            }
    }
}

struct WhereField: View {
    @Binding var destination: String
    let onSubmit: () -> Void
    
    var body: some View {
        
        Text("Where to?")
            .font(.title2)
            .fontWeight(.semibold)
        
        HStack {
            Image(systemName: "magnifyingglass")
                .imageScale(.small)
            
            TextField("Search destinations", text: $destination)
                .font(.subheadline)
                .onSubmit(onSubmit)
            
            if !destination.isEmpty {
                Button {
                    destination = ""
                } label: {
                    CloseButton()
                }
                .tint(.black)
            }
        }
        .animation(.snappy, value: destination.isEmpty)
        .frame(height: 44)
        .padding(.horizontal)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1)
                .foregroundStyle(Color(.systemGray4))
        }
    }
}

struct WhenField: View {
    @Binding var from: Date
    @Binding var to: Date
    
    var body: some View {
        Text("When's your trip?")
            .font(.title2)
            .fontWeight(.semibold)
        
        Group {
            DatePicker("From", selection: $from, in: Date.now..., displayedComponents: .date)
            DatePicker("To", selection: $to, in: from.addingTimeInterval(86400)..., displayedComponents: .date)
        }
        .foregroundStyle(.gray)
        .font(.subheadline)
        .fontWeight(.semibold)
    }
}

struct WhoField: View {
    @Binding var count: Int
    
    var body: some View {
        Text("Who's coming?")
            .font(.title2)
            .fontWeight(.semibold)
        
        Stepper("\(count) Adult\(count > 1 ? "s" : "")", value: $count, in: 1...20)
            .fontWeight(.semibold)
            .font(.subheadline)
    }
}

struct CollapsableCardField<Content: View>: View {
    
    @ViewBuilder var content: Content
    let isSelected: Bool
    let title: String
    let description: String
    let onReveal: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            if isSelected {
                content
            } else {
                HStack {
                    Text(title)
                        .foregroundStyle(.gray)
                    Spacer()
                    Text(description)
                }
                .fontWeight(.semibold)
                .font(.subheadline)
                .contentShape(Rectangle())
                .onTapGesture(perform: onReveal)
            }
        }
        .floatingCardStyle()
    }
}
