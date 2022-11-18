//
//  PosterImagesRepository.swift
//  MovieSample
//
//  Created by Nguyen Linh on 18/11/2022.
//
import Foundation

protocol PosterImagesRepository {
    func fetchImage(with imagePath: String, completion: @escaping (Result<Data, Error>) -> Void) -> Cancellable?
}
