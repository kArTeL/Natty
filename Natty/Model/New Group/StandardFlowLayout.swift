//
//  StandardFlowLayout.swift
//  Natty
//
//  Created by Neil García on 11/2/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import UIKit

class StandardFlowLayout: UICollectionViewFlowLayout {
    
    let inset: CGFloat = UIConstants.inset
    
    override init() {
        super.init()
        minimumInteritemSpacing = inset/3
        minimumLineSpacing = inset
        scrollDirection = .vertical
        sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
