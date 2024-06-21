//
//  APIError.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 19/06/24.
//

import Foundation

enum APIError: Error {
    case badURL
    case badResponse
    case badDecoding
}
