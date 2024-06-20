//
//  PopulatedState.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 18/06/24.
//

import SwiftUI

extension HomeView {
    struct PopulatedStateView: View {
        @EnvironmentObject private var viewModel: ViewModel
        
        var body: some View {
            List(viewModel.movies) { movie in
                NavigationLink(value: movie) {
                    MovieInformation(
                        title: movie.wrappedTitle,
                        imageURL: movie.wrappedPosterURL,
                        score: Int(movie.userScore)
                    )
                }
                .swipeActions {
                    DeleteButton(titleHidden: true) { 
                        viewModel.delete(movie)
                    }
                }
            }
            .navigationDestination(for: Movie.self) { movie in
                MovieDetailView(movie: movie)
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeView.PopulatedStateView()
            .environmentObject(HomeView.ViewModel(inMemoryOnly: true))
    }
}
