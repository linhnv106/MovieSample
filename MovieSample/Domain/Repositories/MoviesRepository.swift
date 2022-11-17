//
//  MoviesRepository.swift
//  MovieSample
//
//  Created by Nguyen Linh on 18/11/2022.
//

import Foundation
protocol MoviesRepository {
    @discardableResult
    func fetchMoviesList(query: MovieQuery,
                         completion: @escaping (Result<MoviesPage, Error>) -> Void) -> Cancellable?
}
