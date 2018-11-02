//
//  MStandarSection.swift
//  Natty
//
//  Created by Neil García on 11/2/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import Foundation

struct MStandardSection: Section {
    var title: String = ""
    var subtitle: String = ""
    var items: [Item] = [MStandardItem]()
    var type: SectionType = .standard
    
    init() { }
    
    init(title: String, subtitle: String, items:[Item]) {
        self.title = title
        self.subtitle = subtitle
        self.items = items
    }
}
