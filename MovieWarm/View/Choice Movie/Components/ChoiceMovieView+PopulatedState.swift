//
//  ChoiceMovieView+PopulatedState.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 19/06/24.
//

import SwiftUI

extension ChoiceMovieView {
    struct PopulatedState: View {
        @Environment(\.dismissSearch) private var dismissSearch
        @EnvironmentObject private var viewModel: ViewModel
        var dismissAction: () -> Void
        
        var body: some View {
            List {
                Section("Results") {
                    ForEach(viewModel.movies, id: \.id) { movie in
                        NavigationLink(value: movie) {
                            ResultInformation(
                                imageURL: URL(string: movie.poster),
                                title: movie.title,
                                released: movie.released
                            )
                        }
                    }
                }
            }
            .navigationDestination(for: Movie.Get.self) { movie in
                NewMovieReviewView(movie: movie) {
                    dismissAction()
                    dismissSearch()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ChoiceMovieView.PopulatedState { }
            .environmentObject(ChoiceMovieView.ViewModel())
    }
}
