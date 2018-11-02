//
//  StandarSectionViewModel.swift
//  Natty
//
//  Created by Neil García on 11/2/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import Foundation

class StandardSectionViewModel {
    var section = MStandardSection()
    
    init() {}
    
    init (standardSection: MStandardSection) {
        self.section = standardSection
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
    
    func item(indexPath: IndexPath) -> MStandardItem {
        return section.items[indexPath.row] as! MStandardItem
    }
    
}
