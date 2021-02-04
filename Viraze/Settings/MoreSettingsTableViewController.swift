//
//  MoreSettingsTableViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 18/9/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit
import SafariServices

class MoreSettingsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
//        tableView.reloadRows(at: [IndexPath(row: 2, section: 0)], with: .automatic)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "morecell", for: indexPath)

        // Configure the cell...

        /*if indexPath.row == 0 {
            cell.textLabel?.text = "Credits"
            cell.accessoryType = .none
            cell.detailTextLabel?.text = ""
        } else */
        if indexPath.row == 0 {
            cell.textLabel?.text = "License"
            cell.accessoryType = .none
            cell.detailTextLabel?.text = ""
        } else if indexPath.row == 1 {
            cell.textLabel?.text = "Language"
            cell.detailTextLabel?.text = defaults.string(forKey: "language")
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*if indexPath.row == 0 {
            performSegue(withIdentifier: "seeCredits", sender: nil)
        }*/
        /*else*/ if indexPath.row == 0 {
            present(SFSafariViewController(url: URL(string: "https://github.com/granwyntan/Viraze/blob/master/LICENSE")!), animated: true)
        } else if indexPath.row == 1 {
            performSegue(withIdentifier: "seeLanguage", sender: nil)
        }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
