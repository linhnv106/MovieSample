//
//  MoviesListItemViewModel.swift
//  MovieSample
//
//  Created by Nguyen Linh on 18/11/2022.
//
// **Note**: This item view model is to display data and does not contain any domain model to prevent views accessing it

import Foundation

struct MoviesListItemViewModel: Equatable {
    let title: String
    let type: String
    let year: String?
    let posterImagePath: String?
}

extension MoviesListItemViewModel {

    init(movie: Movie) {
        self.title = movie.title ?? ""
        self.posterImagePath = movie.posterPath
        self.type = movie.type ?? ""
        self.year = movie.year
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()
