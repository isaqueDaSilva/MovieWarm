//
//  MovieDetailView.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 19/06/24.
//

import SwiftUI

struct MovieDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: ViewModel
    
    var body: some View {
        List {
            VStack {
                Cover(
                    coverImageURL: viewModel.movie.wrappedPosterURL
                )
                
                Description(
                    title: viewModel.movie.wrappedTitle,
                    rating: Int(viewModel.movie.userScore)
                )
                .multilineTextAlignment(.center)
            }
            .listRowSeparator(.hidden)
            .frame(maxWidth: .infinity)
            
            Section("Informations") {
                LabeledContent("Released:", value: viewModel.movie.wrappedRelesed)
                
                LabeledContent("Runtime:", value: viewModel.movie.wrappedRuntime)
                
                NavigationLink {
                    MoreDetailView(
                        genre: viewModel.movie.wrappedGenre,
                        director: viewModel.movie.wrappedDirector,
                        writer: viewModel.movie.wrappedWriter,
                        plot: viewModel.movie.wrappedPlot,
                        country: viewModel.movie.wrappedCountry,
                        awards: viewModel.movie.wrappedAwards,
                        ratings: viewModel.movie.wrappedRatings,
                        actors: viewModel.movie.wrappedActors
                    )
                } label: {
                    Text("More Informations")
                }

            }
            .bold()
            
            Section("Your Review") {
                Text(viewModel.movie.wrappedReview)
            }
            
            Section {
                DeleteButton(titleHidden: false) {
                    viewModel.showDeleteAlert()
                }
                .foregroundStyle(.red)
            }
            .listRowSeparator(.hidden, edges: .bottom)
        }
        .listStyle(.plain)
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Edit") {
                viewModel.showingEditPage = true
            }
        }
        .sheet(isPresented: $viewModel.showingEditPage) {
            EditReviewView(movie: viewModel.movie)
        }
        .alert(viewModel.alertTitle, isPresented: $viewModel.showingAlert) {
            if viewModel.isDeleteAction {
                Button(role: .cancel){
                } label: {
                    Text("Cancel")
                }
                
                Button(role: .destructive) {
                    viewModel.deleteMovie()
                    dismiss()
                } label: {
                    Text("Delete")
                }
            } else {
                Button("OK") { }
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

//#Preview {
//    NavigationStack {
//        MovieDetailView(movie: movie!)
//    }
//}
