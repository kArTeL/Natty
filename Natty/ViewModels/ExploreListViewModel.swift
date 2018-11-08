//
//  ExploreListViewModel.swift
//  Natty
//
//  Created by Neil García on 9/28/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import Foundation

class ExploreListViewModel {
    
    var sections = [Section]()
    
    init() { }
    
    func getData() {
        let item = MFeaturedItem(title: "Lost in the eternity", subtitle:"A subrealist photo about the author life in the best country of the world.", image: "https://static.adweek.com/adweek.com-prod/wp-content/uploads/2017/10/VSCO-brands-CONTENT-2017.jpg")
       
        let item2 = MFeaturedItem(title: "", subtitle:"", image: "https://amp.businessinsider.com/images/5697f2e1dd0895fb778b473d-750-500.jpg")
        let item3 = MFeaturedItem(title: "Family", subtitle:"Find a home that family love. Stretch out and enjoy a space of your own. but i don't know if this fucking text crop as well", image: "http://static2.uk.businessinsider.com/image/5980d6dd27fa6b041e5ed726-1190-625/vsco-the-best-free-photo-app-on-the-market-just-added-video-editing-tools--but-youll-have-to-pay-for-them.jpg")
        let item4 = MFeaturedItem(title: "", subtitle:"", image: "http://4.bp.blogspot.com/-UUnc7QIj_vY/VIFqKdVh_fI/AAAAAAAAUg0/RaLMJlMpLkY/s1600/IMG_0208.JPG")
        let featuredSection = MFeaturedSection(title: "", subtitle: "Los mejores consejos para tu hogar", items: [item, item2, item3, item4, item4, item4, item4, item4, item4, item4, item4, item4, item4, item4, item4, item4, item4, item4, item4, item4])
        
        
        let gridItem = MGridItem(title: "", subtitle:"", image: "https://s3.amazonaws.com/files.shopmoment.com/general/momentist/vsco-33.jpg?mtime=20170410182229")
        let gridItem2 = MGridItem(title: "", subtitle:"", image: "https://static1.squarespace.com/static/52c3f40de4b09bdc91f2ec10/58d9792b414fb508b08bf1fe/58d9793f893fc0c8f57d30be/1490647405529/IMG_8832.JPG")
        let gridItem3 = MGridItem(title: "", subtitle:"", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRG8OpoNqcIoI8o0Eg4eSjTPdHE-x6NKVSGyit55CStzHaVfYMJcw")
        let gridItem4 = MGridItem(title: "", subtitle:"", image: "https://static.tumblr.com/e3c6b1b4dce66af078446f7e9aae66ec/gd7w5p0/Dvjo068db/tumblr_static_filename_640_v2.jpg")
        let gridItem5 = MGridItem(title: "", subtitle:"", image: "http://static2.uk.businessinsider.com/image/5980d6dd27fa6b041e5ed726-1190-625/vsco-the-best-free-photo-app-on-the-market-just-added-video-editing-tools--but-youll-have-to-pay-for-them.jpg")
        let gridItem6 = MGridItem(title: "", subtitle:"", image: "https://amp.businessinsider.com/images/5697f2e1dd0895fb778b473d-750-500.jpg")
         let gridItem7 = MGridItem(title: "", subtitle:"", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI2wE1E-9JXUKqrHVx0L46xt_wu6wjuax1QXJA8OAmOs48AZd27w")
         let gridItem8 = MGridItem(title: "", subtitle:"", image: "https://amp.businessinsider.com/images/5697f2e1dd0895fb778b473d-750-500.jpg")
         let gridItem9 = MGridItem(title: "", subtitle:"", image: "https://amp.businessinsider.com/images/5697f2e1dd0895fb778b473d-750-500.jpg")
        let gridSection = MGridSection(title: "Just for your", subtitle: "Best house's histories", items: [gridItem,gridItem2, gridItem3,gridItem4,gridItem5,gridItem6, gridItem7,gridItem8,gridItem9])
        
        let gridSection2 = MGridSection(title: "Just for your", subtitle: "Best house's histories", items: [gridItem,gridItem2, gridItem3,gridItem4,gridItem5,gridItem6])
        let featuredSection2 = MFeaturedSection(title: "Editorial", subtitle: "Highlighting VSCo and the comunity", items: [item, item2])
        
         let standarItem = MStandardItem(title: "Maria Graciela", subtitle:"La mejor limpiadora del oeste", image: "https://s3.amazonaws.com/files.shopmoment.com/general/momentist/vsco-33.jpg?mtime=20170410182229")
        let standardSection = MStandardSection(title: "Conozca a las mejores", subtitle: "Las mejores limpiadoras de Costa Rica", items: [standarItem, standarItem, standarItem, standarItem])
        
        let videoSection = MVideoSection(title: "El mejor video de la semana", subtitle: "Tenemos a la instructura galardonada como la super estrella", videoURL: URL(string: "https://s3-us-west-1.amazonaws.com/tapp-images/offersVideos/nfl3/nfl3.m3u8"))
        
        sections.append(featuredSection)
        sections.append(gridSection)
        sections.append(standardSection)
        sections.append(videoSection)
        sections.append(gridSection2)
        sections.append(featuredSection2)
        sections.append(featuredSection2)
        sections.append(featuredSection2)
        sections.append(featuredSection2)
        sections.append(featuredSection2)
        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
//        sections.append(featuredSection2)
        
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
