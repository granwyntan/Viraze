//
//  SettingsTableViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 20/8/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    @IBOutlet weak var devCell: UITableViewCell!
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

//    override func viewDidAppear(_ animated: Bool) {
//        if let name = defaults.string(forKey: "UserName") {
//            if name == "<@#dev!>" {
//                devCell.isHidden = false
//            } else {
//                devCell.isHidden = true
//            }
//        } else {
//            devCell.isHidden = true
//        }
//    }
    @IBAction func hideSettings(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "seeAcct", sender: nil)
        } else if indexPath.row == 1 {
            performSegue(withIdentifier: "seeSecAndPriv", sender: nil)
        } else if indexPath.row == 2 {
            performSegue(withIdentifier: "seeHelp", sender: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
