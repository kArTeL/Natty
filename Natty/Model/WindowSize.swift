//
//  WindowSize.swift
//  Natty
//
//  Created by Neil García on 11/1/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

struct WindowSize {
    static var size: CGSize {
        return CGSize(width: Defaults[.windowdWidth], height: Defaults[.windowHeight])
    }
    
    static func set(size: CGSize) {
        Defaults[.windowdWidth] = Double(size.width)
        Defaults[.windowHeight] = Double(size.height)
    }
}
