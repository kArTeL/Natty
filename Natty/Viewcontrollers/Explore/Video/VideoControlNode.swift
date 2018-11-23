//
//  VideoControlNode.swift
//  Natty
//
//  Created by Neil García on 11/20/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import AsyncDisplayKit

protocol VideoControlDelegate: class {
    func playPressed()
    func pausePressed()
    func likePressed()
    func fullScreenPressed()
}

class VideoControlNode: ASDisplayNode {
    
    private var playButton =  ASImageNode()
    private var likeButton = ASImageNode()
    private var fullScreenButton = ASImageNode()
    
    weak var delegate: VideoControlDelegate?
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        playButton.contentMode = .scaleAspectFill
        likeButton.contentMode = .scaleAspectFill
        fullScreenButton.contentMode = .scaleAspectFill
        playButton.image = Asset.play.image
        likeButton.image = Asset.like.image
        fullScreenButton.image = Asset.like.image
    }
    
    convenience init(delegate: VideoControlDelegate) {
        self.init()
        self.delegate = delegate
    }
    
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let padding: CGFloat = 12
        
        let playButtonRatioSpect = ASRatioLayoutSpec(ratio: 1.0, child: playButton)
        
        let likeButtonRatioSpect = ASRatioLayoutSpec(ratio: 1.0, child: likeButton)
        let likeButtonInset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: padding, left: 0, bottom: padding, right: 0), child: likeButtonRatioSpect)
        
        let fullScreenButtonRatioSpect = ASRatioLayoutSpec(ratio: 1.0, child: fullScreenButton)
        let fullScreenButtonInset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: padding, left: 0, bottom: padding, right: 0), child: fullScreenButtonRatioSpect)
        
        let stack  =  ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 30,
            justifyContent: .center,
            alignItems: .center,
            children: [likeButtonInset, playButtonRatioSpect, fullScreenButtonInset])
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        return ASInsetLayoutSpec(insets: insets, child: stack)
    }
    
}
