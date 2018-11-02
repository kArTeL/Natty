//
//  GridSectionViewModel.swift
//  Natty
//
//  Created by Neil García on 11/2/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import Foundation

class GridSectionViewModel {

    var section = MGridSection()
    
    init() {}
    
    init (gridSection: MGridSection) {
        self.section = gridSection
    }
    
    var title: String {
        return section.title
    }
    
    var subtitle: String {
        return section.subtitle
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    var numberOfRows: Int {
        return section.items.count
    }
    
    func item(indexPath: IndexPath) -> MGridItem {
        return section.items[indexPath.row] as! MGridItem
    }
    
    
}
