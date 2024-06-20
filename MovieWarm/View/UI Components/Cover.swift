//
//  Cover.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 18/06/24.
//

import SwiftUI

struct Cover: View {
    let coverImageURL: URL?
    let width: CGFloat
    let height: CGFloat
    
    @ViewBuilder
    private var errorImage: some View {
        Icons.movieclapper.sysyemImage
            .resizable()
            .scaledToFill()
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.black.opacity(0.1))
            }
            .frame(width: width, height: height)
    }
    
    var body: some View {
        Group {
            if let coverImageURL {
                AsyncImage(url: coverImageURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: width, height: height)
                    case .success(let coverImage):
                        coverImage
                            .resizable()
                            .scaledToFill()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame(width: width, height: height)
                    case .failure(_):
                        errorImage
                    @unknown default:
                        errorImage
                    }
                }
            } else {
                errorImage
            }
        }
    }
    
    init(
        coverImageURL: URL?,
        width: CGFloat = 150,
        height: CGFloat = 225
    ) {
        self.coverImageURL = coverImageURL
        self.width = width
        self.height = height
    }
}

#Preview {
    VStack {
        Cover(
            coverImageURL: URL(string: "https://www.akamai.com/site/pt/images/article/2023/how-a-web-api-works.png")
        )
        .padding()
        
        Cover(coverImageURL: nil)
    }
}
