//
//  Description.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 18/06/24.
//

import SwiftUI

struct Description: View {
    let title: String
    let rating: Int
    
    var body: some View {
        Group {
            Text(title)
                .font(.title3)
                .bold()
                .padding(.bottom, 5)
            
            RatingStars(rating: .constant(rating))
        }
    }
}

#Preview {
    Description(title: "Dummy", rating: 4)
}
