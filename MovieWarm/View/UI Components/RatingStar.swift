//
//  RatingStar.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 18/06/24.
//

import SwiftUI

/// A view for star-based reviews.
struct RatingStars: View {
    
    @Binding var rating: Int
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { number in
                Icons.star.sysyemImage
                    .font(.subheadline)
                    .foregroundStyle(number > rating ? .gray : .yellow)
                    .onTapGesture { rating = number }
            }
        }
    }
    
    init(rating: Binding<Int>) {
        _rating = rating
    }
}

#Preview {
    RatingStars(rating: .constant(2))
}
