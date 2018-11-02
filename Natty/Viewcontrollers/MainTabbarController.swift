//
//  MainTabbarController.swift
//  Natty
//
//  Created by Neil García on 10/30/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import AsyncDisplayKit

class MainTabbarController: ASTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let exploreNavigationController = ASNavigationController(rootViewController: ExploreViewController())
        tabBar.tintColor = UIColor.darkGray
        exploreNavigationController.navigationBar.prefersLargeTitles = true
        viewControllers = [exploreNavigationController]
    }
    
    

}
