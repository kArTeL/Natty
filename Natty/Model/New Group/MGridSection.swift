//
//  MGridSection.swift
//  Natty
//
//  Created by Neil García on 11/2/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import Foundation

struct MGridSection: Section {
    var title: String = ""
    var subtitle: String = ""
    var items: [Item] = [MGridItem]()
    var type: SectionType = .grid
    
    init() { }
    
    init(title: String, subtitle: String, items:[Item]) {
        self.title = title
        self.subtitle = subtitle
        self.items = items
    }
}
