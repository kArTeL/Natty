//
//  MVideoSection.swift
//  Natty
//
//  Created by Neil García on 11/8/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import UIKit

class MVideoSection: Section {
    var title: String = ""
    var subtitle: String = ""
    var items: [Item] = [Item]()
    var type: SectionType = .video
    var videoURL: URL?
    
    init() { }
    
    init(title: String, subtitle: String, videoURL: URL?) {
        self.title = title
        self.subtitle = subtitle
        self.videoURL = videoURL
    }
}
