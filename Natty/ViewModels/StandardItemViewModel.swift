//
//  StandardItemViewModel.swift
//  Natty
//
//  Created by Neil García on 11/2/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import Foundation

class StandardItemViewModel {
    var title: String {
        return item.title
    }
    var subtitle: String {
        return item.subtitle
    }
    var item = MStandardItem()
    
    init(item: MStandardItem) {
        self.item = item
    }
    
    var imageURL: URL {
        return URL(string: item.image)!
    }
}
