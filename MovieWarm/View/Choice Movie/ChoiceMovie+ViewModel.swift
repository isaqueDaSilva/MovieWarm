//
//  ChoiceMovie+ViewMode.swift
//  MovieWarm
//
//  Created by Isaque da Silva on 19/06/24.
//

import Combine
import Foundation

extension ChoiceMovieView {
    @MainActor
    final class ViewModel: ObservableObject {
        @Published var movies = [Movie.Get]()
        @Published var searchText = ""
        @Published var viewState: ViewState = .noItem
        
        private var cancellables = Set<AnyCancellable>()
        
        private func addObservable() {
            $searchText
                .debounce(for: .seconds(0.3), scheduler: DispatchQueue.main)
                .sink { [weak self] text in
                    guard let self else { return }
                    
                    if !text.isEmpty {
                        self.search(text)
                    }
                }
                .store(in: &cancellables)
            
        }
        
        private func search(_ text: String) {
            Task {
                do {
                    await MainActor.run {
                        viewState = .loading
                    }
                    
                    let movie = try await Fetcher.fetch(with: text)
                    
                    await MainActor.run {
                        movies = [movie]
                        viewState = .load
                    }
                } catch let error {
                    await MainActor.run {
                        viewState = .noItem
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        init() { addObservable() }
    }
}
