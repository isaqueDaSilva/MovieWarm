//
//  MoreDetailView.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 19/06/24.
//

import SwiftUI

extension MovieDetailView {
    struct MoreDetailView: View {
        let genre: String
        let director: String
        let writer: [Writer]
        let plot: String
        let country: String
        let awards: String
        let ratings: [Movie.Rating]
        let actors: [Actor]
        
        var body: some View {
            List {
                Section {
                    LabeledContent("Genre:", value: genre)
                    
                    LabeledContent("Director:", value: director)
                    
                    LabeledContent("Country:", value: country)
                }
                .bold()
                
                Section("Writer") {
                    ForEach(writer, id: \.id) {
                        Text($0.name)
                    }
                }
                
                Section("Actors") {
                    ForEach(actors, id: \.id) {
                        Text($0.name)
                    }
                }
                
                Section("Plot") {
                    Text(plot)
                }
                
                Section("Awards") {
                    Text(awards)
                }
                
                Section("Ratings") {
                    ForEach(ratings, id: \.id) { rating in
                        LabeledContent("\(rating.source):", value: rating.value)
                    }
                }
                .bold()
                
            }
            .listStyle(.plain)
            .navigationTitle("More Details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#Preview {
    NavigationStack {
        MovieDetailView.MoreDetailView(
            genre: "Action",
            director: "Eric Kripke",
            writer: [.init(name: "Eric Kripke")],
            plot: "Os irmãos Sam e Dean Winchester encaram cenários sinistros caçando monstros. Velhos truques, armas e esconderijos não funcionam mais e seus amigos os traem, forçando os irmãos a contar um com o outro enquanto enfrentam novos inimigos.",
            country: "USA",
            awards: "Emmys",
            ratings: [.init(source: "Rotten Tomatoes", value: "94%")],
            actors: [.init(name: "Jensen Ackles"), .init(name: "Jared Padalecki")]
        )
    }
}
