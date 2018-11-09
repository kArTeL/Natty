//
//  ASCellNodeExtension.swift
//  Natty
//
//  Created by Neil García on 11/9/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import AsyncDisplayKit

extension ASCellNode {
    func hideSeparator() {
        separatorInset = UIEdgeInsets(top: 0, left: -5000, bottom: 0, right: 5000)
    }
}
