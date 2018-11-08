//
//  VideoSectionTableViewCell'.swift
//  Natty
//
//  Created by Neil García on 11/8/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import AsyncDisplayKit

class VideoSectionTableViewCell: ASCellNode {
    let videoNode = ASVideoNode()
    let titleLabel = ASTextNode()
    let subtitleLabel = ASTextNode()
    let subtitleHeight = 40.0
    let titleHeight = 40.0
    let spaceBetweenTitleAndSubtitle = 2.0
    let spaceBetweenVideo = 4.0
    var cellSize = CGSize(width: 0.0, height: 0.0)
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        clipsToBounds = true
    }
    
    
    convenience init(viewModel: VideoSectionViewModel, size: CGSize) {
        self.init()
        cellSize = size
        let height = Double(size.height) - (subtitleHeight - titleHeight - spaceBetweenTitleAndSubtitle - spaceBetweenVideo - UIConstants.bottomPadding)
        videoNode.style.preferredSize = CGSize(width: Double(size.width), height: height)
        if let videoURL = viewModel.videoURL {
            videoNode.asset = AVAsset(url: videoURL)
            videoNode.gravity = AVLayerVideoGravity.resizeAspectFill.rawValue
            videoNode.shouldAutoplay = true
            videoNode.shouldAutorepeat = false
            videoNode.shouldCacheImage = true
        }
        
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
        backgroundColor = .green
        subtitleLabel.backgroundColor = .yellow
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        
        titleLabel.style.preferredSize      = CGSize(width:  Double(cellSize.width), height: titleHeight)
        subtitleLabel.style.preferredSize   = CGSize(width:  Double(cellSize.width), height: subtitleHeight)
        
        
        let labelStack  =  ASStackLayoutSpec(
            direction: .vertical,
            spacing: 1,
            justifyContent: .start,
            alignItems: .start,
            children: [titleLabel, subtitleLabel])
        
        let stack  = ASStackLayoutSpec(
            direction: .vertical,
            spacing: CGFloat(spaceBetweenVideo),
            justifyContent: .start,
            alignItems: .stretch,
            children: [labelStack, videoNode])
        
        let insetLayout = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: UIConstants.inset, bottom: UIConstants.bottomPadding, right: UIConstants.inset), child: stack)
        return insetLayout
    }
    
}
