//
//  MovieInformation.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 19/06/24.
//

import SwiftUI

extension HomeView {
    struct MovieInformation: View {
        let title: String
        let imageURL: URL?
        let score: Int
        
        var body: some View {
            HStack {
                Cover(
                    coverImageURL: imageURL,
                    width: 67,
                    height: 100
                )
                .padding(.trailing)
                .padding(.leading, 7)
                
                VStack(alignment: .leading) {
                    Description(
                        title: title,
                        rating: score
                    )
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    HomeView.MovieInformation(
        title: "Sobrenatural",
        imageURL: URL(string: "https://a-static.mlcdn.com.br/450x450/poster-cartaz-sobrenatural-supernatural-a-pop-arte-poster/poparteskins2/15938544507/61a560b0eefcc9c282919ab8c48e423a.jpeg"),
        score: 4
    )
    .padding()
}
