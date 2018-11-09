//
//  FeaturedSectionTableViewCell.swift
//  Natty
//
//  Created by Neil García on 10/30/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import AsyncDisplayKit

class FeaturedSectionTableViewCell: ASCellNode {
    
    let titleLabel = ASTextNode()
    let subtitleLabel = ASTextNode()
    
    let flowLayout = SnapPagingLayout()
    lazy var collectionViewNode: ASCollectionNode = ASCollectionNode(collectionViewLayout: flowLayout)
    private var indexOfCellBeforeDragging = 0
    lazy var featuredSectionViewModel = FeaturedSectionViewModel()
    
    
    override init() {
        super.init()
        hideSeparator()
        collectionViewNode.delegate = self
        collectionViewNode.dataSource = self
        collectionViewNode.view.showsHorizontalScrollIndicator = false
        collectionViewNode.style.preferredSize = CGSize(width: WindowSize.size.width, height: 295)
        selectionStyle = .none
        collectionViewNode.placeholderEnabled = true
        automaticallyManagesSubnodes = true
//        backgroundColor = .yellow
//        collectionViewNode.backgroundColor = .white
    }
    
    convenience init(sectionViewModel: FeaturedSectionViewModel) {
        self.init()
        featuredSectionViewModel = sectionViewModel
        
        titleLabel.attributedText = NSAttributedString(
            string: sectionViewModel.title,
            attributes: [
                NSAttributedString.Key.font: FontFamily.SFProDisplay.bold.font(size: 25),
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.kern: -0.3
            ])
        subtitleLabel.attributedText = NSAttributedString(
            string: sectionViewModel.subtitle,
            attributes: [
                NSAttributedString.Key.font: FontFamily.SFProDisplay.regular.font(size: 14),
                NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                NSAttributedString.Key.kern: -0.3
            ])
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let labelsStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 2,
            justifyContent: .end,
            alignItems: .start,
            children: [ titleLabel, subtitleLabel])
        
        let labelContainerSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10, left: 18, bottom: 10, right: 5), child: labelsStack)
        
        let collectionViewStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 1,
            justifyContent: .start,
            alignItems: .stretch,
            children: [ labelContainerSpec, collectionViewNode])
        
        return collectionViewStack
    }
    

}

extension FeaturedSectionTableViewCell: ASCollectionDataSource, ASCollectionDelegate {
    
    // MARK: ASCollectionNode data source and delegate.
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return featuredSectionViewModel.numberOfSections
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return featuredSectionViewModel.numberOfRows
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        return { [weak self] () -> ASCellNode in
            if let strongSelf = self {
                let featuredItemViewModel = FeaturedItemViewModel(item: strongSelf.featuredSectionViewModel.item(indexPath: indexPath))
                let cellNode = FeaturedItemTableViewCell(viewModel: featuredItemViewModel)
                return cellNode
            } else {
                fatalError("not enough memory")
            }
          
        }
    }
}
