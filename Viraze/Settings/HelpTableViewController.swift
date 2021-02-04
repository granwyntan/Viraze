//
//  HelpTableViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 22/8/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit
import MessageUI

class HelpTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {
    
    let helpStuff = ["About Us", "Tutorial", "Contact"]

    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return helpStuff.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "helpCell", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = helpStuff[indexPath.row]
//        cell.textLabel?.font = UIFont(name: "Futura", size: 17)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let alert = UIAlertController(title: "About Us", message: "Viraze\n\nDeveloped by Granwyn Tan,\nJoel Hui and Ashok\nSST S2-05 2020\nLast Updated on 4 Feb 2021\n\nMade with ♥ from Singapore", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else if indexPath.row == 1 {
            performSegue(withIdentifier: "goTutorial", sender: nil)
        } else if indexPath.row == 2 {
            showMailComposer()
        }
    }
    
    func showMailComposer() {
        guard MFMailComposeViewController.canSendMail() else {
            //Show alert informing the user
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["granwyn_tan@s2019.ssts.edu.sg"])
        composer.setSubject("Feedback for Viraze App")
        if let name = defaults.string(forKey: "UserName"){
            composer.setMessageBody("Dear App Developer,\n\n\(name)\nUser of Viraze", isHTML: false)
        } else {
            composer.setMessageBody("Dear App Developer,\n\nUser of Viraze", isHTML: false)
        }
        present(composer, animated: true)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            //Show error alert
            controller.dismiss(animated: true)
            return
        }
        
        switch result {
            case .cancelled:
                print("Cancelled")
            case .failed:
                print("Failed to send")
            case .saved:
                print("Saved")
            case .sent:
                print("Email Sent")
            @unknown default:
                break
        }
        
        controller.dismiss(animated: true)
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
