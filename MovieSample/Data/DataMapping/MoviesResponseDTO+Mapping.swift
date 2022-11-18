//
//  MoviesResponseDTO+Mapping.swift
//  MovieSample
//
//  Created by Nguyen Linh on 18/11/2022.
//

import Foundation
struct MoviesResponseDTO: Decodable {
    private enum CodingKeys: String, CodingKey {
        case response = "Response"
        case totalResults = "totalResults"
        case movies = "Search"
    }
    let response: String
    let totalResults: String?
    let movies: [MovieDTO]
}

extension MoviesResponseDTO {
    struct MovieDTO: Decodable {
        private enum CodingKeys: String, CodingKey {
            case id = "imdbID"
            case title = "Title"
            case year = "Year"
            case type = "Type"
            case posterPath = "Poster"
        }
       
        let id: String
        let title: String?
        let posterPath: String?
        let year: String?
        let type: String?
    }
}

// MARK: - Mappings to Domain

extension MoviesResponseDTO {
    func toDomain() -> MoviesPage {
        return .init(totalResults: totalResults,
                     movies: movies.map { $0.toDomain() })
    }
}

extension MoviesResponseDTO.MovieDTO {
    func toDomain() -> Movie {
        return .init(id: id,
                     title: title,
                     type: type,
                     posterPath: posterPath,
                     year: year)
    }
}

// MARK: - Private

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
}()
