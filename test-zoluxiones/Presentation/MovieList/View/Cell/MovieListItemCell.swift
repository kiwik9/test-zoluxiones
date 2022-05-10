//
//  MovieListItemCell.swift
//  test-zoluxiones
//
//  Created by Julio Perez on 10/05/22.
//

import UIKit
import Kingfisher

class MoviesListItemCell: UITableViewCell {

    static let reuseIdentifier = String(describing: MovieListItemViewModel.self)
    
    static let height = CGFloat(130)
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var releaseLabel: UILabel!
    
    @IBOutlet weak var descripctionLabel: UILabel!
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bind(_ viewModel: MovieListItemViewModel) {
        self.titleLabel.text = viewModel.title
        self.releaseLabel.text = viewModel.releaseDate
        self.descripctionLabel.text = viewModel.description
        self.movieImageView.kf.setImage(with: URL( PictureUtil().getPhotoUrl(viewModel.image) ))
    }
}
