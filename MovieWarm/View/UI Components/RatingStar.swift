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
    
    private var maximumRating = 5
    private var image = Image(systemName: Icons.star.rawValue)
    private var offColor = Color.gray
    private var onColor = Color.yellow
    
    var body: some View {
        HStack {
            ForEach(1...maximumRating, id: \.self) { number in
                image
                    .font(.subheadline)
                    .foregroundStyle(number > rating ? offColor : onColor)
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
