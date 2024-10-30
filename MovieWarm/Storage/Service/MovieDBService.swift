//
//  MovieDBService.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 9/1/24.
//

import Foundation
import CoreData

struct MovieDBService {
    // MARK: - Shared initializer -
    static let shared = MovieDBService()
    
    static let preview: MovieDBService = {
        let service = MovieDBService(inMemoryOnly: true)
        
        service.makeChanges { context in
            _ = Movie.makeDummyMovie(with: context)
        }
        
        return service
    }()
    
    // MARK: - Properties -
    private let container: NSPersistentContainer
    
    private func getContext() -> NSManagedObjectContext { container.viewContext }
    
    // MARK: - Methods -
    func makeChanges(
        _ action: @escaping (NSManagedObjectContext) -> Void
    ) {
        let context = getContext()
        context.perform { action(context) }
    }
    
    func fetch(
        with fetchResultsController: NSFetchedResultsController<Movie>
    ) throws -> [Movie] {
        try fetchResultsController.performFetch()
        
        guard let movies = fetchResultsController.fetchedObjects else {
            return []
        }
        
        return movies
    }
    
    func fetchChanges(
        with controller: NSFetchedResultsController<NSFetchRequestResult>
    ) -> [Movie] {
        guard let movies = controller.fetchedObjects as? [Movie] else { return [] }
        return movies
    }
    
    func fetchedResultController(
        with request: NSFetchRequest<Movie>
    ) -> NSFetchedResultsController<Movie> {
        NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: container.viewContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
    }
    
    private init(inMemoryOnly: Bool = false) {
        container = NSPersistentContainer(name: "MoviesDB")
        
        guard let description = container.persistentStoreDescriptions.first else {
            print("Failed to retrieve a persistent store description.")
            return
        }
        
        if inMemoryOnly {
            description.url = URL(filePath: "/dev/null")
        }
        
        container.loadPersistentStores { _, error in
            if let error {
                print("Falied to loading Movies entity with error: \(error).")
            }
        }
        
        container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }
}
