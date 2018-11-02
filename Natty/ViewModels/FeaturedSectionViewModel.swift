//
//  FeaturedSectionViewModel.swift
//  Natty
//
//  Created by Neil García on 9/28/18.
//  Copyright © 2018 Natty. All rights reserved.
//

<<<<<<< HEAD
import Foundation
=======
import UIKit
>>>>>>> c7d09500a6b2aef16c6ef3d9f63fbbede51c4f24

class FeaturedSectionViewModel {

    var section = MFeaturedSection()
    
    init() {}
    
    init (featuredSection: MFeaturedSection) {
        self.section = featuredSection
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
    
    func item(indexPath: IndexPath) -> MFeaturedItem {
        return section.items[indexPath.row] as! MFeaturedItem
    }
    
    
    
}
