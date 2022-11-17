//
//  Movie.swift
//  MovieSample
//
//  Created by Nguyen Linh on 18/11/2022.
//

import Foundation
struct Movie: Equatable, Identifiable {
    let id: String
    let title: String?
    let type: String?
    let posterPath: String?
    let year: Date?
}

struct MoviesPage: Equatable {
    let totalResults: Int
    let movies: [Movie]
}
