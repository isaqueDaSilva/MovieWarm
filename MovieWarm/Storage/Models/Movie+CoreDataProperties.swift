//
//  Movie+CoreDataProperties.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 18/06/24.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var released: String?
    @NSManaged public var runtime: String?
    @NSManaged public var genre: String?
    @NSManaged public var director: String?
    @NSManaged public var writer: String?
    @NSManaged public var actors: String?
    @NSManaged public var plot: String?
    @NSManaged public var country: String?
    @NSManaged public var awards: String?
    @NSManaged public var poster: String?
    @NSManaged public var ratings: Data?
    @NSManaged public var id: UUID?
    @NSManaged public var userScore: Int16
    @NSManaged public var userReview: String?
    @NSManaged public var createAt: Date

    
    // MARK: - Internal Methods -
    
    private func noItemSavedMessage(for item: String) -> String {
        "No \(item) saved..."
    }
    
    // MARK: - Wrapped Properties -
    
    public var wrappedTitle: String {
        title ?? noItemSavedMessage(for: "title")
    }
    
    public var wrappedRelesed: String {
        released ?? noItemSavedMessage(for: "relese data")
    }
    
    public var wrappedRuntime: String {
        runtime ?? noItemSavedMessage(for: "runtime")
    }
    
    public var wrappedGenre: String {
        genre ?? noItemSavedMessage(for: "genre")
    }
    
    public var wrappedDirector: String {
        director ?? noItemSavedMessage(for: "director")
    }
    
    public var wrappedWriter: [Writer] {
        guard let writer else {
            return []
        }
        
        return writer.transformInAWritersArray
    }
    
    public var wrappedActors: [Actor] {
        guard let actors else {
            return []
        }
        
        return actors.transformInAActorArray
    }
    
    public var wrappedPlot: String {
        plot ?? noItemSavedMessage(for: "plot")
    }
    
    public var wrappedCountry: String {
        country ?? noItemSavedMessage(for: "country")
    }
    
    public var wrappedAwards: String {
        awards ?? noItemSavedMessage(for: "awards")
    }
    
    public var wrappedPosterURL: URL? {
        guard let poster else { return nil }
        
        return URL(string: poster)
    }
    
    public var wrappedRatings: [Rating] {
        guard let ratingsData = ratings else { return [] }
        
        let decoder = JSONDecoder()
        
        guard let ratingsDecoded = try? decoder.decode([Rating].self, from: ratingsData) else {
            return []
        }
        
        return ratingsDecoded
    }
    
    public var wrappedReview: String {
        userReview ?? noItemSavedMessage(for: "user review")
    }
    
    // MARK: - Dummy Models -
    
    public static func makeDummyMovie(with context: NSManagedObjectContext) -> [Movie] {
        var movies = [Movie]()
        
        for index in 0..<10 {
            let rating = Rating(source: "Dummy rating", value: "85%")
            let encoder = JSONEncoder()
            let ratingData = try? encoder.encode(rating)
            
            let movie = Movie(context: context)
            movie.id = UUID()
            movie.title = "Movie \(index + 1)"
            movie.released = "\(index)/\(index)/\(index)"
            movie.runtime = "\(index * 12)"
            movie.genre = "Action"
            movie.director = "Director \(index + 1)"
            movie.writer = "Writer \(index + 1)"
            movie.actors = "Actor \(index + 1)"
            movie.plot = "Plot \(index + 1)"
            movie.country = "Country \(index + 1)"
            movie.awards = "Award \(index + 1)"
            movie.poster = "https://a-static.mlcdn.com.br/450x450/poster-cartaz-sobrenatural-supernatural-a-pop-arte-poster/poparteskins2/15938544507/61a560b0eefcc9c282919ab8c48e423a.jpeg"
            movie.ratings = ratingData
            movie.userScore = 4
            movie.userReview = "Review \(index + 1)"
            movie.createAt = .now
            
            try? context.save()
            
            movies.append(movie)
        }
        
        return movies
    }
}

extension Movie : Identifiable { }

