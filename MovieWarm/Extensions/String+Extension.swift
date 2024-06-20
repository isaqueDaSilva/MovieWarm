//
//  String+Extension.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 18/06/24.
//

import Foundation

extension String {
    var transformInAActorArray: [Actor] {
        let strArray = self.components(separatedBy: ", ")
        let actorsArray = strArray.convertToActorsArray()
        return actorsArray
    }
    
    var transformInAWritersArray: [Writer] {
        let strArray = self.components(separatedBy: ", ")
        let writersArray = strArray.convertToWrittersArray()
        return writersArray
    }
}
