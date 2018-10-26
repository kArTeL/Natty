//
//  ExploreListViewModel.swift
//  Natty
//
//  Created by Neil García on 9/28/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import UIKit

class ExploreListViewModel {
    
    var sections = [MFeaturedSection]()
    
    init() { }
    
    func getData() {
        let item = MFeaturedItem(title: "", subtitle:"", image: "https://www.antevenio.com/wp-content/uploads/2016/04/20-ejemplos-de-banners-creativos.jpg")
        let item2 = MFeaturedItem(title: "", subtitle:"", image: "https://www.antevenio.com/wp-content/uploads/2016/04/20-ejemplos-de-banners-creativos.jpg")
        let item3 = MFeaturedItem(title: "", subtitle:"", image: "https://www.antevenio.com/wp-content/uploads/2016/04/20-ejemplos-de-banners-creativos.jpg")
        let featuredSection = MFeaturedSection(title: "Tips para tí", subtitle: "Los mejores consejos para tu hogar", items: [item, item2, item3])
        sections.append(featuredSection)
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numbersOfRows(inSection section: Int) -> Int {
        return sections.count
    }
    
    func sectionTitle(section: Int) -> String {
        return sections[section].title
    }
    
    func sectionSubtitle(sectionIndex section: Int) -> String {
        return sections[section].subtitle
    }
    
    func sectionType( sectionIndex: Int) -> SectionType {
        return sections[sectionIndex].type
    }
    func section( indexPath: IndexPath) -> Section {
        return sections[indexPath.row]
    }
    
}
