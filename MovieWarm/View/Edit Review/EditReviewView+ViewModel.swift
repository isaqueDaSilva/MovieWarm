//
//  EditReviewView+ViewModel.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 19/06/24.
//

import Foundation

extension EditReviewView {
    final class ViewModel: ObservableObject {
        @Published var score = 1
        @Published var review = ""
        @Published var alertTitle = ""
        @Published var alertMessage = ""
        @Published var showingAlert = false
        
        let movie: Movie
        private let dbService: MovieDBService
        
        var isDisabled: Bool {
            (review.isEmpty) || (review == movie.wrappedReview)
        }
        
        func updateOnDB(_ completation: @escaping () -> Void) {
            var errorThrowing: Error?
            
            dbService.makeChanges { [weak self] context in
                guard let self else { return }
                
                if self.movie.userScore != Int16(self.score) {
                    self.movie.userScore = Int16(self.score)
                }
                
                if self.movie.userReview != self.review {
                    self.movie.userReview = self.review
                }
                
                do {
                    try context.save()
                } catch {
                    errorThrowing = error
                }
            }
            
            if let errorThrowing {
                self.alertTitle = "Falied to update movie"
                self.alertMessage = errorThrowing.localizedDescription
                self.showingAlert = true
            } else {
                completation()
            }
        }
        
        init(movie: Movie, inMemoryOnly: Bool = false) {
            self.movie = movie
            dbService = inMemoryOnly ? .preview : .shared
            
            _score = Published(initialValue: Int(movie.userScore))
            _review = Published(initialValue: movie.wrappedReview)
        }
    }
}
