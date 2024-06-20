//
//  MovieDetailView+ViewModel.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 19/06/24.
//

import Foundation

extension MovieDetailView {
    final class ViewModel: ObservableObject {
        @Published var movie: Movie
        @Published var showingAlert = false
        @Published var alertTitle = ""
        @Published var alertMessage = ""
        
        @Published var showingEditPage = false
        var isDeleteAction = false
        
        private let dbService: MovieDBService
        
        private func createAlert(
            with title: String,
            and message: String = ""
        ) {
            alertTitle = title
            alertMessage = message
            showingAlert = true
        }
        
        func showDeleteAlert() {
            isDeleteAction = true
            createAlert(
                with: "Are you sure you want to delete this movie?"
            )
        }
        
        func deleteMovie() {
            var errorThrowing: Error?
            
            dbService.makeChanges { [weak self] context in
                guard let self else { return }
                context.delete(movie)
                
                do {
                    try context.save()
                } catch {
                    errorThrowing = error
                }
            }
            
            if let errorThrowing {
                isDeleteAction = false
                createAlert(
                    with: "Failed to delete movie",
                    and: errorThrowing.localizedDescription
                )
            }
        }
        
        init(movie: Movie, inMemoryOnly: Bool = false) {
            _movie = Published(initialValue: movie)
            dbService = inMemoryOnly ? .preview : .shared
        }
    }
}
