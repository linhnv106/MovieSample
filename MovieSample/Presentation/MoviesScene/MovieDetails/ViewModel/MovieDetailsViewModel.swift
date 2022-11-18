//
//  MovieDetailsViewModel.swift
//  MovieSample
//
//  Created by Nguyen Linh on 18/11/2022.
//

import Foundation

protocol MovieDetailsViewModelInput {
    func updatePosterImage()
}

protocol MovieDetailsViewModelOutput {
    var title: String { get }
    var posterImage: Observable<Data?> { get }
    var isPosterImageHidden: Bool { get }
    var type: String { get }
}

protocol MovieDetailsViewModel: MovieDetailsViewModelInput, MovieDetailsViewModelOutput { }

final class DefaultMovieDetailsViewModel: MovieDetailsViewModel {
    
    private let posterImagePath: String?
    private let posterImagesRepository: PosterImagesRepository
    private var imageLoadTask: Cancellable? { willSet { imageLoadTask?.cancel() } }

    // MARK: - OUTPUT
    let title: String
    let posterImage: Observable<Data?> = Observable(nil)
    let isPosterImageHidden: Bool
    let type: String
    
    init(movie: Movie, posterImagesRepository: PosterImagesRepository) {
        self.title = movie.title ?? ""
        self.type = movie.type ?? ""
        self.posterImagePath = movie.posterPath
        self.isPosterImageHidden = movie.posterPath == nil
        self.posterImagesRepository = posterImagesRepository
    }
}

// MARK: - INPUT. View event methods
extension DefaultMovieDetailsViewModel {
    
    func updatePosterImage() {
         let posterImagePath = "https://cdn.pixabay.com/photo/2022/11/14/19/25/squirrel-7592356_1280.jpg"

        imageLoadTask = posterImagesRepository.fetchImage(with: posterImagePath) { result in
            guard self.posterImagePath == posterImagePath else { return }
            switch result {
            case .success(let data):
                self.posterImage.value = data
            case .failure: break
            }
            self.imageLoadTask = nil
        }
    }
}
