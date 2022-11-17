//
//  APIEndpoints.swift
//  MovieSample
//
//  Created by Nguyen Linh on 18/11/2022.
//

import Foundation
struct APIEndpoints {
    
    static func getMovies(with moviesRequestDTO: MoviesRequestDTO) -> Endpoint<MoviesResponseDTO> {
        
        return Endpoint(path: "/",
                        method: .get,
                        queryParametersEncodable: moviesRequestDTO)
    }
}
