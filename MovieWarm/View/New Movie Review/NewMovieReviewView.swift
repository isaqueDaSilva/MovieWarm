//
//  NewMovieReviewView.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 19/06/24.
//

import SwiftUI

struct NewMovieReviewView: View {
    @StateObject private var viewModel: ViewModel
    var dismissAction: () -> Void
    
    var body: some View {
        EditView(
            navTitle: "Create new Review",
            title: viewModel.movie.title,
            releseDate: viewModel.movie.released,
            posterURL: URL(string: viewModel.movie.poster),
            userScore: $viewModel.score,
            userReview: $viewModel.review,
            isDisabled: viewModel.isDisabled
        ) {
            dismissAction()
        } confirmationAction: {
            viewModel.createOnDB {
                dismissAction()
            }
        }
        .navigationBarBackButtonHidden()
        .alert(
            viewModel.alertTitle,
            isPresented: $viewModel.showingAlert
        ) { } message: {
            Text(viewModel.alertMessage)
        }
        
    }
    
    init(movie: Movie.Get, inMemoryOnly: Bool = false, action: @escaping () -> Void) {
        _viewModel = StateObject(wrappedValue: .init(movie: movie, inMemoryOnly: inMemoryOnly))
        self.dismissAction = action
    }
}

#Preview {
    NewMovieReviewView(
        movie: .init(
            title: "Sobrenatural - Pilot",
            released: "September 13th, 2005",
            runtime: "42 minutes",
            genre: "Fiction",
            director: "",
            writer: "",
            actors: "",
            plot: "",
            country: "US",
            awards: "",
            poster: "https://a-static.mlcdn.com.br/450x450/poster-cartaz-sobrenatural-supernatural-a-pop-arte-poster/poparteskins2/15938544507/61a560b0eefcc9c282919ab8c48e423a.jpeg",
            ratings: []
        ),
        inMemoryOnly: true
    ) { }
}
