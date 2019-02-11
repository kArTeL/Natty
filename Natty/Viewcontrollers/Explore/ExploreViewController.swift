//
//  ExploreViewController.swift
//  Natty
//
//  Created by Neil García on 10/30/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import UIKit
import AsyncDisplayKit
import Hero
import Transitional

class ExploreViewController: ASViewController<ASDisplayNode>, ASTableDataSource, ASTableDelegate  {
    
    lazy var exploreListViewModel = ExploreListViewModel()
    
    var tableNode: ASTableNode {
        return node as! ASTableNode
    }
    
    init() {
        super.init(node: ASTableNode())
        title = "Explore"
        tableNode.delegate = self
        tableNode.dataSource = self
        
        //tableNode.sele
        exploreListViewModel.getData()
        tableNode.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("storyboards are incompatible with truth and beauty")
    }
    
    
    // MARK: ASTableNode data source and delegate.
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return exploreListViewModel.numberOfSections()
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
       return exploreListViewModel.numbersOfRows(inSection: section)
    }
    
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
       // let node = ASTextCellNode()
        switch exploreListViewModel.sectionType(sectionIndex: indexPath.row) {
        case .featured:
            let featuredSection = exploreListViewModel.section(indexPath: indexPath) as! MFeaturedSection
            let featuredSectionViewModel = FeaturedSectionViewModel(featuredSection: featuredSection)
            return FeaturedSectionTableViewCell(sectionViewModel: featuredSectionViewModel)
        case .grid:
            let gridSection = exploreListViewModel.section(indexPath: indexPath) as! MGridSection
            let gridSectionViewModel = GridSectionViewModel(gridSection: gridSection)
            return GridSectionTableViewCell(sectionViewModel: gridSectionViewModel)
        case .video:
            let videoSection = exploreListViewModel.section(indexPath: indexPath) as! MVideoSection
            let videoSectionViewModel = VideoSectionViewModel(section: videoSection)
            return VideoSectionTableViewCell(viewModel: videoSectionViewModel, delegate: self)
        default:
            let standardSection = exploreListViewModel.section(indexPath: indexPath) as! MStandardSection
            let standardSectionViewModel = StandardSectionViewModel(standardSection: standardSection)
            return StandardSectionTableViewCell(sectionViewModel: standardSectionViewModel)
            //break
        }
     //   return node
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func presentVideoController() {
        
    }
}


extension ExploreViewController: VideoDelegate {
    func didTapFullScreen(videoNode: ASVideoNode?, videoSection: VideoSectionTableViewCell) {
        if let videoNode = videoNode {
            let fullScreenVideoController = StoryboardScene.Main.videoFullScreenViewController.instantiate()
            fullScreenVideoController.videoNode = videoNode
            fullScreenVideoController.videoCellSection = videoSection
            transitionalPresentation(fullScreenVideoController, style: .zoomIn)
        }
    }
    

}

