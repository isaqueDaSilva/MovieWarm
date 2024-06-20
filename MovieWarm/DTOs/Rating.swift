//
//  Rating.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 18/06/24.
//

import Foundation

extension Movie {
    public struct Rating: Identifiable, Hashable, Sendable {
        public let id = UUID()
        let source: String
        let value: String
    }
}

extension Movie.Rating: Codable {
    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(source, forKey: .source)
        try container.encode(value, forKey: .value)
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.source = try container.decode(String.self, forKey: .source)
        self.value = try container.decode(String.self, forKey: .value)
    }
}
