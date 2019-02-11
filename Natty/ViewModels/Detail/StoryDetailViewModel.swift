//
//  StoryDetailViewModel.swift
//  Natty
//
//  Created by Neil García on 11/28/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import UIKit

struct StoryDetailViewModel {
    var title: String = ""
    var detail: String = ""
    var image: URL?
    
    init(title: String ,detail: String, image: URL ) {
        self.title = title
        self.detail = detail
        self.image = image
    }
    init() {}
}
