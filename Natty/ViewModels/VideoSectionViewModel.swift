//
//  VideoSectionViewModel.swift
//  Natty
//
//  Created by Neil García on 11/8/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import UIKit

class VideoSectionViewModel {
    
    var section = MVideoSection()
    
    init() {}
    
    init (section: MVideoSection) {
        self.section = section
    }
    
    var title: String {
        return section.title
    }
    
    var subtitle: String {
        return section.subtitle
    }
    var videoURL: URL? {
        return section.videoURL
    }
    
}
