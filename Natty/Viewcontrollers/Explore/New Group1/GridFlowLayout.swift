//
//  GridFlowLayout.swift
//  Natty
//
//  Created by Neil García on 11/2/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import UIKit

class GridFlowLayout: UICollectionViewFlowLayout {

    let inset: CGFloat = UIConstants.inset
    
    override init() {
        super.init()
        minimumInteritemSpacing = 0.5
        minimumLineSpacing = 0.5
        scrollDirection = .vertical
        sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: UIConstants.bottomPadding, right: inset)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
