//
//  MovieDetailsViewController.swift
//  MovieSample
//
//  Created by Nguyen Linh on 18/11/2022.
//

import UIKit

final class MovieDetailsViewController: UIViewController, StoryboardInstantiable {

    @IBOutlet private var posterImageView: UIImageView!
    @IBOutlet private var overviewTextView: UITextView!

    // MARK: - Lifecycle

    private var viewModel: MovieDetailsViewModel!
    
    static func create(with viewModel: MovieDetailsViewModel) -> MovieDetailsViewController {
        let view = MovieDetailsViewController.instantiateViewController()
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bind(to: viewModel)
    }

    private func bind(to viewModel: MovieDetailsViewModel) {
        viewModel.posterImage.observe(on: self) { [weak self] in self?.posterImageView.image = $0.flatMap(UIImage.init) }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewModel.updatePosterImage()
    }

    // MARK: - Private

    private func setupViews() {
        title = viewModel.title
        overviewTextView.text = viewModel.type
        posterImageView.isHidden = viewModel.isPosterImageHidden
        view.accessibilityIdentifier = AccessibilityIdentifier.movieDetailsView
    }
}
