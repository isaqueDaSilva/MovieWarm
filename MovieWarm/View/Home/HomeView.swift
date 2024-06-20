//
//  ContentView.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 18/06/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: ViewModel
    
    @Namespace private var transition
    private let transitionID = "TRANSITION"
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.movies.isEmpty {
                    EmptyStateView()
                        .matchedGeometryEffect(id: transitionID, in: transition)
                } else {
                    PopulatedStateView()
                        .matchedGeometryEffect(id: transitionID, in: transition)
                        .environmentObject(viewModel)
                }
            }
            .navigationTitle("Movies")
            .listStyle(.plain)
            .alert(
                viewModel.alertTitle,
                isPresented: $viewModel.showingAlert
            ) { } message: {
                Text(viewModel.description)
            }
            .toolbar {
                Button {
                    viewModel.showingCreatingView = true
                } label: {
                    Icons.plusCircle.sysyemImage
                }
            }
            .sheet(isPresented: $viewModel.showingCreatingView) {
                ChoiceMovieView()
            }
        }
    }
    
    init(inMemoryOnly: Bool = false) {
        _viewModel = StateObject(wrappedValue: .init(inMemoryOnly: inMemoryOnly))
    }
}

#Preview {
    HomeView(inMemoryOnly: true)
}
