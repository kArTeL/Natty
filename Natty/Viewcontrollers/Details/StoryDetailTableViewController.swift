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
    @IBOutlet weak var descriptionLabel: UILabel!
    var detailViewModel = StoryDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 90
        tableView.tableFooterView = UIView(frame: .zero)
        setupUI(storyDetailViewModel: detailViewModel)
        
    }

    /// Setup ui
    ///
    /// - Parameter storyDetailViewModel: storyViewModel to fill all the inputs.
    func setupUI(storyDetailViewModel: StoryDetailViewModel) {
        title = storyDetailViewModel.title
        topImageView.kf.setImage(with: storyDetailViewModel.image!)
        descriptionLabel.text = storyDetailViewModel.detail
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
