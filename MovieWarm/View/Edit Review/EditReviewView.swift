//
//  EditReviewView.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 19/06/24.
//

import SwiftUI

struct EditReviewView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            EditView(
                navTitle: "Edit",
                title: viewModel.movie.wrappedTitle,
                releseDate: viewModel.movie.wrappedRelesed,
                posterURL: viewModel.movie.wrappedPosterURL,
                userScore: $viewModel.score,
                userReview: $viewModel.review,
                isDisabled: viewModel.isDisabled
            ) {
                dismiss()
            } confirmationAction: {
                viewModel.updateOnDB {
                    dismiss()
                }
            }
            .alert(
                viewModel.alertTitle,
                isPresented: $viewModel.showingAlert
            ) { } message: {
                Text(viewModel.alertMessage)
            }
        }
    }
    
    init(movie: Movie, inMemoryOnly: Bool = false) {
        _viewModel = StateObject(
            wrappedValue: .init(
                movie: movie,
                inMemoryOnly: inMemoryOnly
            )
        )
    }
}
