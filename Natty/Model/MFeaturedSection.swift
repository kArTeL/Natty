//
//  MFeaturedSection.swift
//  Natty
//
//  Created by Neil García on 9/28/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import UIKit

/// Featured section model.
struct MFeaturedSection: Section {
    
    var title: String = "Tips para tí"
    var subtitle: String = "Los mejores consejos para tu hogar"
    var items: [Item] = [MFeaturedItem]()
    var type: SectionType = .featured
    
    init() { }
    
    init(title: String, subtitle: String, items:[Item]) {
        self.title = title
        self.subtitle = subtitle
        self.items = items
    }
}
