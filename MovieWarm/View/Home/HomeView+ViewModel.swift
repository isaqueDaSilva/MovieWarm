//
//  HomeView+ViewModel.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 18/06/24.
//

import CoreData
import Foundation

extension HomeView {
    final class ViewModel: NSObject, ObservableObject {
        @Published var movies = [Movie]()
        @Published var alertTitle = ""
        @Published var alertMessage = ""
        @Published var showingAlert = false
        @Published var showingCreatingView = false
        
        private let resultController: NSFetchedResultsController<Movie>
        private let dbService: MovieDBService
        
        private func showingAlert(with error: Error) {
            self.alertTitle = "Falied to fetch movies."
            self.alertMessage = error.localizedDescription
            self.showingAlert = true
        }
        
        func fetchMovies() {
            do {
                let moviesFetched = try dbService.fetch(with: resultController)
                movies = moviesFetched
            } catch {
                showingAlert(with: error)
            }
        }
        
        func delete(_ movie: Movie) {
            var errorThrowing: Error?
            
            dbService.makeChanges { context in
                context.delete(movie)
                
                do {
                    try context.save()
                } catch {
                    errorThrowing = error
                }
            }
            
            if let errorThrowing {
                showingAlert(with: errorThrowing)
            }
        }
        
        init(inMemoryOnly: Bool = false) {
            dbService = inMemoryOnly ? .preview : .shared
            
            let sort = NSSortDescriptor(key: "createAt", ascending: false)
            let request = Movie.fetchRequest()
            request.sortDescriptors = [sort]
            
            resultController = dbService.fetchedResultController(with: request)
            
            super.init()
            
            resultController.delegate = self
            
            fetchMovies()
        }
    }
}

extension HomeView.ViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<any NSFetchRequestResult>) {
        movies = dbService.fetchChanges(with: controller)
    }
}
