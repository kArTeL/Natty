//
//  StoryDetailTableViewController.swift
//  Natty
//
//  Created by Neil García on 11/28/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import UIKit
import Kingfisher


class StoryDetailTableViewController: UITableViewController {

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /// Setup ui
    ///
    /// - Parameter storyDetailViewModel: storyViewModel to fill all the inputs.
    func setupUI(storyDetailViewModel: StoryDetailViewModel) {
        topImageView.kf.setImage(with: storyDetailViewModel.image)
        titleLabel.text = storyDetailViewModel.title
        descriptionLabel.text = storyDetailViewModel.detail
        
    }
}
