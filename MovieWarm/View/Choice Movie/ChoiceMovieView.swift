//
//  ChoiceMovieView.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 19/06/24.
//

import SwiftUI

struct ChoiceMovieView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = ViewModel()
    
    @Namespace private var transition
    private let transitionID = "TRANSITION"
    
    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.viewState {
                case .load:
                    PopulatedState {
                        dismiss()
                    }
                    .matchedGeometryEffect(id: transitionID, in: transition)
                    .environmentObject(viewModel)
                    
                case .loading:
                    ProgressView()
                        .matchedGeometryEffect(id: transitionID, in: transition)
                case .noItem:
                    EmptyStateView()
                        .matchedGeometryEffect(id: transitionID, in: transition)
                        .transition(.opacity)
                }
            }
            .navigationTitle("Choice a movie")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $viewModel.searchText, prompt: "Insert a name of the movie here...")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Icons.chevronLeft.sysyemImage
                            Text("Back")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ChoiceMovieView()
}
