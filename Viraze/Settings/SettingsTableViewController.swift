//
//  SettingsTableViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 20/8/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
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
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            performSegue(withIdentifier: "seeAcct", sender: nil)
        } else if indexPath.row == 1 {
            performSegue(withIdentifier: "seeHelp", sender: nil)
        } else if indexPath.row == 2 {
            performSegue(withIdentifier: "seeMore", sender: nil)
        } else if indexPath.row == 3 {
            let alert = UIAlertController(title: "Are you sure you want to Sign Out?", message: "Your data and preferences will not be saved", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in
                self.defaults.removeObject(forKey: "UserName")
                self.defaults.removeObject(forKey: "pfpFileDir")
                self.defaults.removeObject(forKey: "TutorialPage")
//                if var viewControllers = self.navigationController?.viewControllers
//                {
//                    if viewControllers.contains(where: {
//                        return $0 is ViewController
//                    })
//                    {
//                        self.performSegue(withIdentifier: "logOut", sender: nil)
//                    } else {
//                        viewControllers.insert(ViewController(), at: 0)
//                        self.navigationController!.setViewControllers(viewControllers, animated:false)
                    //                        self.performSegue(withIdentifier: "logOut", sender: nil)
//                        self.present(ViewController(), animated: true, completion: nil)
//                let navigationController = UINavigationController.init(rootViewController: vc)
                self.navigationController?.setNavigationBarHidden(true, animated: false)
                self.navigationController?.viewControllers.removeAll()
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                vc.modalPresentationStyle = .fullScreen
                vc.modalTransitionStyle = .crossDissolve
                self.present(vc, animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: {action in}))
            self.present(alert, animated: true, completion: nil)
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
