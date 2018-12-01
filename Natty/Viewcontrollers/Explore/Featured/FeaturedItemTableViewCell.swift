//
//  FeaturedItemTableViewCell.swift
//  Natty
//
//  Created by Neil García on 10/30/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import AsyncDisplayKit

class FeaturedItemTableViewCell: ASCellNode {

    let imageView = ASNetworkImageNode()
    let titleLabel = ASTextNode()
    let subtitleLabel = ASTextNode()
    
//    var isTouched: Bool = false {
//        
//    }
    
    override init() {
        super.init()
        imageView.contentMode = .scaleAspectFill
        automaticallyManagesSubnodes = true
        imageView.shouldRenderProgressImages = true
        subtitleLabel.maximumNumberOfLines = 2
        subtitleLabel.truncationAttributedText = NSAttributedString(string: " ...")
        subtitleLabel.additionalTruncationMessage = NSAttributedString(string: "see more", attributes: [
            NSAttributedString.Key.font: FontFamily.SFProDisplay.bold.font(size: 15),
            NSAttributedString.Key.foregroundColor: UIColor.darkGray,
            NSAttributedString.Key.kern: 0.2
            ])
        clipsToBounds = true
        cornerRadius = 1.5
    }

    convenience init(viewModel: FeaturedItemViewModel) {
        self.init()
        imageView.url = viewModel.imageURL
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 0.02
        paragraphStyle.lineHeightMultiple = 0.9
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
                NSAttributedString.Key.kern: 0.2,
                NSAttributedString.Key.paragraphStyle: paragraphStyle
            ])
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let width = WindowSize.size.width - WindowSize.size.width * 0.18
        imageView.style.preferredSize       = CGSize(width:  width, height: 185)
        titleLabel.style.preferredSize      = CGSize(width:  width, height: 25)
        subtitleLabel.style.preferredSize   = CGSize(width:  width, height: 35)
        
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
