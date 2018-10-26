//
//  FeaturedSectionTableViewCell.swift
//  Natty
//
//  Created by Neil García on 9/28/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import UIKit

class FeaturedSectionTableViewCell: UITableViewCell, UICollectionViewDataSource {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    
    lazy var featuredSectionViewModel = FeaturedSectionViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(_ featuredSectionViewModel: FeaturedSectionViewModel) {
        self.featuredSectionViewModel = featuredSectionViewModel
        itemsCollectionView.dataSource = self
        titleLabel.text  = featuredSectionViewModel.title
        subtitleLabel.text  = featuredSectionViewModel.subtitle
        itemsCollectionView.reloadData()
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return featuredSectionViewModel.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featuredSectionViewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeue(FeaturedItemCollectionViewCell.self, indexPath: indexPath)
        
        let featuredItemViewModel = FeaturedItemViewModel(item: featuredSectionViewModel.item(indexPath: indexPath))
        cell.setupCell(featuredItemViewModel: featuredItemViewModel)
        return cell
    }
}
