//
//  FeaturedItemCollectionViewCell.swift
//  Natty
//
//  Created by Neil García on 9/28/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import UIKit
import Kingfisher

class FeaturedItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    func setupCell(featuredItemViewModel: FeaturedItemViewModel) {
        itemImageView.kf.setImage(with: featuredItemViewModel.imageURL)
    }
}
