//
//  EditView.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 18/06/24.
//

import SwiftUI

struct EditView: View {
    private let navTitle: String
    private let title: String
    private let releseDate: String
    private let posterURL: URL?
    
    @Binding var userScore: Int
    @Binding var userReview: String
    
    var isDisabled: Bool
    
    var cancellAction: () -> Void
    var confirmationAction: () -> Void
    
    var body: some View {
        ScrollView {
            VStack {
                Cover(coverImageURL: posterURL)
                
                VStack {
                    Text(title)
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                    Text("Released in \(releseDate)")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                }
                .padding(.bottom)
                
                VStack() {
                    Text("Review")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField(
                        "Insert here your review...",
                        text: $userReview,
                        axis: .vertical
                    )
                    .padding(10)
                    .lineLimit(10, reservesSpace: true)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.black.opacity(0.1))
                    }
                    .padding(.bottom)
                    
                    RatingStars(rating: $userScore)
                    
                }
            }
            .padding()
        }
        .navigationTitle(navTitle)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button {
                    cancellAction()
                } label: {
                    Text("Cancel")
                }
            }
            
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    confirmationAction()
                } label: {
                    Text("Save")
                }
                .disabled(isDisabled)
            }
        }
    }
    
    init(
        navTitle: String,
        title: String,
        releseDate: String,
        posterURL: URL?,
        userScore: Binding<Int>,
        userReview: Binding<String>,
        isDisabled: Bool,
        _ cancellAction: @escaping () -> Void,
        confirmationAction: @escaping () -> Void
    ) {
        self.navTitle = navTitle
        self.title = title
        self.releseDate = releseDate
        self.posterURL = posterURL
        self.confirmationAction = confirmationAction
        self.cancellAction = cancellAction
        self.isDisabled = isDisabled
        
        _userScore = userScore
        _userReview = userReview
    }
}

#Preview {
    NavigationStack {
        EditView(
            navTitle: "Edit",
            title: "Sobrenatural",
            releseDate: "13/09/2005",
            posterURL: URL(string: "https://a-static.mlcdn.com.br/450x450/poster-cartaz-sobrenatural-supernatural-a-pop-arte-poster/poparteskins2/15938544507/61a560b0eefcc9c282919ab8c48e423a.jpeg"),
            userScore: .constant(3),
            userReview: .constant(""),
            isDisabled: false
        ) {
            
        } confirmationAction: {
            
        }
    }
}
