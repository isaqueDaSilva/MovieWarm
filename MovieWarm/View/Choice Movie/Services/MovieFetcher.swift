//
//  MovieFetcher.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 19/06/24.
//

import Foundation

extension ChoiceMovieView {
    enum Fetcher {
        static func fetch(with text: String) async throws -> Movie.Get {
            let apiKey: String = try Configuration.value(for: "API_KEY")
            
            let endpoint = "https://www.omdbapi.com/?i=tt3896198&apikey=\(apiKey)&t=\(text)"
            
            guard let url = URL(string: endpoint) else {
                throw APIError.badURL
            }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw APIError.badResponse
            }
            
            let decoder = JSONDecoder()
            
            guard let movie = try? decoder.decode(Movie.Get.self, from: data) else {
                throw APIError.badDecoding
            }
            
            return movie
        }
    }
}
