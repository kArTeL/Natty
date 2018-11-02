//
//  SectionProtocol.swift
//  Natty
//
//  Created by Neil García on 9/28/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import UIKit

enum SectionType {
    case featured
    case grid
    case standard
}

protocol Section {
    var title: String { get set }
    var subtitle: String { get set }
    var items: [Item] { get set }
    var type: SectionType { get set }
}
