//
//  EmptyStateView.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 18/06/24.
//

import SwiftUI

extension HomeView {
    struct EmptyStateView: View {
        var body: some View {
            EmptyState(description: "Tap on + button to add a new movie in the list.")
        }
    }
}

#Preview {
    NavigationStack {
        HomeView.EmptyStateView()
    }
}
