//
//  EmptyState.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 19/06/24.
//

import SwiftUI

struct EmptyState: View {
    let description: String
    
    var body: some View {
        VStack {
            ContentUnavailableView(
                "No Movies",
                systemImage: Icons.movieclapper.rawValue,
                description:
                    Text(description)
                    .bold()
            )
        }
    }
}

#Preview {
    EmptyState(description: "No movies saved.")
}
