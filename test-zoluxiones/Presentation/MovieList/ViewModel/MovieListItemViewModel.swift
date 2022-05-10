//
//  MovieListItemViewModel.swift
//  test-zoluxiones
//
//  Created by Julio Perez on 10/05/22.
//

import Foundation

struct MovieListItemViewModel: Equatable {
    static func == (lhs: MovieListItemViewModel, rhs: MovieListItemViewModel) -> Bool {
        true
    }
    let title: String
    let description: String
    let releaseDate: String
    let image: String?
    let movie: Movie
}

extension MovieListItemViewModel {
    init(with movie: Movie) {
        self.movie = movie
        self.title = movie.title
        self.image = movie.posterImage
        self.description = movie.description
        self.releaseDate = movie.releadeDate
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()
