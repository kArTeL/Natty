//
//  FeaturedItemViewModel.swift
//  Natty
//
//  Created by Neil García on 9/28/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import Foundation

class FeaturedItemViewModel {
    var title: String {
        return item.title
    }
    var subtitle: String {
        return item.subtitle
    }
    var item = MFeaturedItem()
    
    init(item: MFeaturedItem) {
        self.item = item
    }
    
    var imageURL: URL {
        return URL(string: item.image)!
    }
}
