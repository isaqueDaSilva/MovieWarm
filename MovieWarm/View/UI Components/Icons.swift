//
//  Icons.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 18/06/24.
//

import Foundation
import SwiftUI

enum Icons: String {
    case plusCircle = "plus.circle"
    case movieclapper = "movieclapper"
    case trash = "trash"
    case star = "star"
    case chevronLeft = "chevron.left"
    
    var sysyemImage: Image {
        .init(systemName: self.rawValue)
    }
}
