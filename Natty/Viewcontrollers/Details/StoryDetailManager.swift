//
//  StoryDetailManager.swift
//  Natty
//
//  Created by Neil García on 2/1/19.
//  Copyright © 2019 Natty. All rights reserved.
//

import Foundation
import UIKit
import AsyncDisplayKit

class StoryDetailManager {
    static func showDetail(withBannerURL bannerURL: URL, title: String, detail: String) {
        let storyDetailViewController = StoryboardScene.Main.storyDetailTableViewController.instantiate()
        if let topMostTabBarController = UIApplication.shared.keyWindow?.topMostViewController() as? UITabBarController {
            if let topMostNavigationController = topMostTabBarController.viewControllers![topMostTabBarController.selectedIndex] as? ASNavigationController {
                
                let storyDetailViewModel = StoryDetailViewModel(title: title ,detail: detail, image: bannerURL )
                storyDetailViewController.detailViewModel = storyDetailViewModel
               // storyDetailViewController.setupUI(storyDetailViewModel: storyDetailViewModel)
                topMostNavigationController.pushViewController(storyDetailViewController, animated: true)
            }
        }
    }
}
