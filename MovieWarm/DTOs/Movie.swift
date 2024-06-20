//
//  Movie.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 18/06/24.
//

import Foundation

extension Movie {
    struct Get: Identifiable, Hashable, Sendable {
        let id = UUID()
        let title: String
        let released: String
        let runtime: String
        let genre: String
        let director: String
        let writer: String
        let actors: String
        let plot: String
        let country: String
        let awards: String
        let poster: String
        let ratings: [Rating]
    }
}

extension Movie.Get: Codable {
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(released, forKey: .released)
        try container.encode(runtime, forKey: .runtime)
        try container.encode(genre, forKey: .genre)
        try container.encode(director, forKey: .director)
        try container.encode(writer, forKey: .writer)
        try container.encode(actors, forKey: .actors)
        try container.encode(plot, forKey: .plot)
        try container.encode(country, forKey: .country)
        try container.encode(awards, forKey: .awards)
        try container.encode(poster, forKey: .poster)
        try container.encode(ratings, forKey: .ratings)
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.released = try container.decode(String.self, forKey: .released)
        self.runtime = try container.decode(String.self, forKey: .runtime)
        self.genre = try container.decode(String.self, forKey: .genre)
        self.director = try container.decode(String.self, forKey: .director)
        self.writer = try container.decode(String.self, forKey: .writer)
        self.actors = try container.decode(String.self, forKey: .actors)
        self.plot = try container.decode(String.self, forKey: .plot)
        self.country = try container.decode(String.self, forKey: .country)
        self.awards = try container.decode(String.self, forKey: .awards)
        self.poster = try container.decode(String.self, forKey: .poster)
        self.ratings = try container.decode([Movie.Rating].self, forKey: .ratings)
    }
}
