//
//  ChoiceMovieView+EmptyState.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 19/06/24.
//

import SwiftUI

extension ChoiceMovieView {
    struct EmptyStateView: View {
        var body: some View {
            EmptyState(description: "There are no films to show.")
        }
    }
}

#Preview {
    ChoiceMovieView.EmptyStateView()
}
