//
//  Collection+Extension.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 18/06/24.
//

import Foundation

extension Collection where Element == String {
    func convertToActorsArray() -> [Actor] {
        self.map( { Actor(name: $0) } )
    }
    
    func convertToWrittersArray() -> [Writer] {
        self.map( { Writer(name: $0) } )
    }
}
