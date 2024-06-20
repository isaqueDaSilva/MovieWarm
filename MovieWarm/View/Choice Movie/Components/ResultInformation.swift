//
//  ResultInformation.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 19/06/24.
//

import SwiftUI

struct ResultInformation: View {
    let imageURL: URL?
    let title: String
    let released: String
    
    var body: some View {
        HStack {
            Cover(
                coverImageURL: imageURL,
                width: 67,
                height: 100
            )
            .padding(.trailing)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title3)
                    .bold()
                    .multilineTextAlignment(.leading)
                
                Text("Released in \(released)")
                    .font(.subheadline)
                    .bold()
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 5)
            }
        }
    }
}

#Preview {
    VStack {
        ResultInformation(
            imageURL: URL(string: "https://a-static.mlcdn.com.br/450x450/poster-cartaz-sobrenatural-supernatural-a-pop-arte-poster/poparteskins2/15938544507/61a560b0eefcc9c282919ab8c48e423a.jpeg"),
            title: "Sobrenatural",
            released: "13/09/2005"
        )
        .padding()
        
        ResultInformation(
            imageURL: nil,
            title: "Sobrenatural",
            released: "13/09/2005"
        )
    }
}
