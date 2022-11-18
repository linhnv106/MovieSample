//
//  MoviesListItemCell.swift
//  MovieSample
//
//  Created by Nguyen Linh on 18/11/2022.
//

import UIKit

final class MoviesListItemCell: UITableViewCell {

    static let reuseIdentifier = String(describing: MoviesListItemCell.self)
    static let height = CGFloat(130)

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var overviewLabel: UILabel!
    @IBOutlet private var posterImageView: UIImageView!

    private var viewModel: MoviesListItemViewModel!
   

    func fill(with viewModel: MoviesListItemViewModel) {
        self.viewModel = viewModel

        titleLabel.text = viewModel.title
        dateLabel.text = viewModel.year
        overviewLabel.text = viewModel.type
        if let urlString = viewModel.posterImagePath, let url = NSURL.init(string: urlString) {
            ImageCache.publicCache.load(url: url) { image in
                if let img = image {
                    self.posterImageView.image = image
                    }
                }
        }
    
    }

}
