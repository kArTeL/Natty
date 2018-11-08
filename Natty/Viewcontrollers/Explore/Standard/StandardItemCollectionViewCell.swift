//
//  StandardItemCollectionViewCell.swift
//  Natty
//
//  Created by Neil García on 11/2/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import AsyncDisplayKit

class StandardItemCollectionViewCell: ASCellNode {
    
    let imageView = ASNetworkImageNode()
    let titleLabel = ASTextNode()
    let subtitleLabel = ASTextNode()
    var cellSize = CGSize(width: 0, height: 0)
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        imageView.contentMode = .scaleAspectFill
        imageView.shouldRenderProgressImages = true
        clipsToBounds = true
    }
    
    convenience init(viewModel: StandardItemViewModel, size: CGSize) {
        self.init()
        imageView.url = viewModel.imageURL
        cellSize = size
        imageView.style.preferredSize = CGSize(width: size.width, height: size.width)
        
        titleLabel.attributedText = NSAttributedString(
            string: viewModel.title,
            attributes: [
                NSAttributedString.Key.font: FontFamily.SFProDisplay.heavy.font(size: 19),
                NSAttributedString.Key.foregroundColor: UIColor.darkGray,
                NSAttributedString.Key.kern: 0.2
            ])
        subtitleLabel.attributedText = NSAttributedString(
            string: viewModel.subtitle,
            attributes: [
                NSAttributedString.Key.font: FontFamily.SFProDisplay.regular.font(size: 15),
                NSAttributedString.Key.foregroundColor: UIColor.darkGray,
                NSAttributedString.Key.kern: 0.2
            ])
//        backgroundColor = .green
//        subtitleLabel.backgroundColor = .yellow
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        
      //  let width = WindowSize.size.width - WindowSize.size.width * 0.18
       // imageView.style.preferredSize       = CGSize(width:  width, height: 185)
        titleLabel.style.preferredSize      = CGSize(width:  cellSize.width, height: 20)
        subtitleLabel.style.preferredSize   = CGSize(width:  cellSize.width, height: 40)
        
       // let imageAspectRatioLayout = ASRatioLayoutSpec(ratio: 1.0, child: imageView)
        
        let labelStack  =  ASStackLayoutSpec(
            direction: .vertical,
            spacing: 1,
            justifyContent: .start,
            alignItems: .start,
            children: [titleLabel, subtitleLabel])
        
        let stack  = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 4,
            justifyContent: .start,
            alignItems: .stretch,
            children: [ imageView, labelStack])
        
        return stack
    }
}
