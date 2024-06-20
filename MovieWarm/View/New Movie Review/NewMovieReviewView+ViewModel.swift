//
//  NewMovieReviewView+ViewModel.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 19/06/24.
//

import Foundation

extension NewMovieReviewView {
    final class ViewModel: ObservableObject {
        @Published var score = 1
        @Published var review = ""
        @Published var alertTitle = ""
        @Published var alertMessage = ""
        @Published var showingAlert = false
        
        let movie: Movie.Get
        private let dbService: MovieDBService
        
        var isDisabled: Bool {
            review.isEmpty
        }
        
        func createOnDB(_ completation: @escaping () -> Void) {
            var errorThrowing: Error?
            
            dbService.makeChanges { [weak self] context in
                guard let self else { return }
                do {
                    let encoder = JSONEncoder()
                    let ratingsData = try encoder.encode(movie.ratings)
                    
                    let newMovie = Movie(context: context)
                    newMovie.id = UUID()
                    newMovie.title = movie.title
                    newMovie.released = movie.released
                    newMovie.runtime = movie.runtime
                    newMovie.genre = movie.genre
                    newMovie.director = movie.director
                    newMovie.writer = movie.writer
                    newMovie.actors = movie.actors
                    newMovie.plot = movie.plot
                    newMovie.country = movie.country
                    newMovie.awards = movie.awards
                    newMovie.poster = movie.poster
                    newMovie.ratings = ratingsData
                    newMovie.userScore = Int16(score)
                    newMovie.userReview = review
                    newMovie.createAt = .now
                    
                    try context.save()
                } catch {
                    errorThrowing = error
                }
            }
            
            if let errorThrowing {
                self.alertTitle = "Falied to save movie"
                self.alertMessage = errorThrowing.localizedDescription
                self.showingAlert = true
            } else {
                completation()
            }
        }
        
        init(movie: Movie.Get, inMemoryOnly: Bool = false) {
            self.movie = movie
            
            dbService = inMemoryOnly ? .preview : .shared
        }
    }
}
