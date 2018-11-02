//
//  GridSectionTableViewCell.swift
//  Natty
//
//  Created by Neil García on 11/2/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import AsyncDisplayKit

class GridSectionTableViewCell: ASCellNode {
    
    let titleLabel = ASTextNode()
    let subtitleLabel = ASTextNode()
    let flowLayout = GridFlowLayout()
    lazy var collectionViewNode: ASCollectionNode = ASCollectionNode(collectionViewLayout: flowLayout)
    lazy var gridSectionViewModel = GridSectionViewModel()
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        separatorInset = UIEdgeInsets(top: 0, left: -5000, bottom: 0, right: 5000)
        collectionViewNode.delegate = self
        collectionViewNode.dataSource = self
        selectionStyle = .none
    }
    
    convenience init(sectionViewModel: GridSectionViewModel) {
        self.init()
        gridSectionViewModel = sectionViewModel
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
        
        let collectionViewWidth =  WindowSize.size.width
        let collectionViewCellWidth = ((WindowSize.size.width - flowLayout.inset*2)/3) - (flowLayout.minimumInteritemSpacing * 2)

        let numbersOfLines = Double(gridSectionViewModel.numberOfRows/3)
        let collectionViewHeight =  numbersOfLines * Double(collectionViewCellWidth) + numbersOfLines*Double(flowLayout.minimumLineSpacing) + Double(UIConstants.bottomPadding)
            
        collectionViewNode.style.preferredSize = CGSize(width:collectionViewWidth, height:CGFloat(collectionViewHeight))
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let labelsStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 2,
            justifyContent: .end,
            alignItems: .start,
            children: [ titleLabel, subtitleLabel])
        
        let labelContainerSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 16, left: 18, bottom: 10, right: 5), child: labelsStack)
        
        let collectionViewStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 1,
            justifyContent: .start,
            alignItems: .stretch,
            children: [ labelContainerSpec, collectionViewNode])
        
        return collectionViewStack
    }

}
extension GridSectionTableViewCell: ASCollectionDataSource, ASCollectionDelegate {
    
    // MARK: ASCollectionNode data source and delegate.
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return gridSectionViewModel.numberOfSections
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return gridSectionViewModel.numberOfRows
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        return { [weak self] () -> ASCellNode in
            if let strongSelf = self {
                let gridItemViewModel = GridItemViewModel(item: strongSelf.gridSectionViewModel.item(indexPath: indexPath))
                let cellNode = GridItemTableViewCell(viewModel: gridItemViewModel, size: (WindowSize.size.width - strongSelf.flowLayout.inset*2)/3 - strongSelf.flowLayout.minimumInteritemSpacing*2)
                return cellNode
            } else {
                fatalError("not enough memory")
            }
            
        }
    }
}

