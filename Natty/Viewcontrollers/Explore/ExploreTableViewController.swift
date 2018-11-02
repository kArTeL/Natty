//
//  ExploreTableViewController.swift
//  Natty
//
//  Created by Neil García on 9/28/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import UIKit

class ExploreTableViewController: UITableViewController {
    
    lazy var exploreListViewModel = ExploreListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exploreListViewModel.getData()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return exploreListViewModel.numberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exploreListViewModel.numbersOfRows(inSection: section)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        switch exploreListViewModel.sectionType(sectionIndex: indexPath.row) {
        case .featured:
            let featuredCell = tableView.dequeue(FeaturedSectionTableViewCell.self)
            let featuredSection = exploreListViewModel.section(indexPath: indexPath) as! MFeaturedSection
            let featuredSectionViewModel = FeaturedSectionViewModel(featuredSection: featuredSection)
            featuredCell.setupCell(featuredSectionViewModel)
            cell  =  featuredCell
            break
        default:
            let featuredCell = tableView.dequeue(FeaturedSectionTableViewCell.self)
            let featuredSection = exploreListViewModel.section(indexPath: indexPath) as! MFeaturedSection
            let featuredSectionViewModel = FeaturedSectionViewModel(featuredSection: featuredSection)
            featuredCell.setupCell(featuredSectionViewModel)
            cell  =  featuredCell
            break
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
