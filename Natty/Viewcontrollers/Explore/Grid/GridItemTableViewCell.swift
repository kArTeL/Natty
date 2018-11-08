//
//  GridItemTableViewCell.swift
//  Natty
//
//  Created by Neil García on 11/2/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import AsyncDisplayKit

class GridItemTableViewCell: ASCellNode {
    
    let imageView = ASNetworkImageNode()
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        imageView.contentMode = .scaleAspectFill
        imageView.shouldRenderProgressImages = true
        clipsToBounds = true
    }
    
    convenience init(viewModel: GridItemViewModel, size: CGFloat) {
        self.init()
        imageView.style.preferredSize       = CGSize(width: size, height: size)
        imageView.url = viewModel.imageURL
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let absoluteLayout = ASWrapperLayoutSpec(layoutElement: imageView)
        return absoluteLayout
    }
}
