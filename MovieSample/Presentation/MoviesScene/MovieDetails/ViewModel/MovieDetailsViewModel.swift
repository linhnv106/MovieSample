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
    private var imageLoadTask: Cancellable? { willSet { imageLoadTask?.cancel() } }

    // MARK: - OUTPUT
    let title: String
    let posterImage: Observable<Data?> = Observable(nil)
    let isPosterImageHidden: Bool
    let type: String
    
    init(movie: Movie) {
        self.title = movie.title ?? ""
        self.type = movie.type ?? ""
        self.posterImagePath = movie.posterPath
        self.isPosterImageHidden = movie.posterPath == nil
    }
}

// MARK: - INPUT. View event methods
extension DefaultMovieDetailsViewModel {
    
    func updatePosterImage() {
//        guard let posterImagePath = posterImagePath else { return }
        let sampleUrl = "https://cdn.pixabay.com/photo/2022/11/02/04/07/deer-7563934_1280.jpg"

        if let url = NSURL.init(string: sampleUrl) {
            ImageCache.publicCache.load(url: url) { image in
                if let img = image {
                    self.posterImage.value = img.jpegData(compressionQuality: 90.0)
                    }
                }
        }
    }
}
