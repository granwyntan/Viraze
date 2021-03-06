//
//  TipsTableViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 7/9/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit

struct cellData {
    var opened: Bool
    var title: String
    var sectionData: [String]?
}

class HazeTableCardViewController: UITableViewController {

    var tableViewData = [cellData]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.title = HazeTableArray[selectedTableHazeCard!-1].title
        
        for i in 0...HazeTableArray[selectedTableHazeCard!-1].data.count-1 {
            if let dataArray = HazeTableArray[selectedTableHazeCard!-1].data[i].items {
                tableViewData.append(cellData(opened: false, title: HazeTableArray[selectedTableHazeCard!-1].data[i].header, sectionData: dataArray))
            } else {
                tableViewData.append(cellData(opened: false, title: HazeTableArray[selectedTableHazeCard!-1].data[i].header))
            }
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.setupLargeTitleAutoAdjustFont()
    }
    
    private lazy var setupLargeTitleLabelOnce: Void = {[unowned self] in
        if #available(iOS 11.0, *) {
            self.setupLargeTitleAutoAdjustFont()
        }
    }()
    
    func setupLargeTitleAutoAdjustFont() {
        guard let navigationBar = navigationController?.navigationBar else {
            return
        }
        // recursively find the label
        func findLabel(in view: UIView) -> UILabel? {
            if view.subviews.count > 0 {
                for subview in view.subviews {
                    if let label = findLabel(in: subview) {
                        return label
                    }
                }
            }
            return view as? UILabel
        }

        if let label = findLabel(in: navigationBar) {
            if label.text == self.title {
                label.adjustsFontSizeToFitWidth = true
                // label.minimumScaleFactor = 0.7
            }
            //label.numberOfLines = 2
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let _ = setupLargeTitleLabelOnce
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return tableViewData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let _ = tableViewData[section].sectionData {
            if tableViewData[section].opened == true {
                return tableViewData[section].sectionData!.count + 1
            }
        }
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let dataIndex = indexPath.row-1
        // Configure the cell...
        if selectedTableHazeCard == 3 {
            if indexPath.row == 0 {
                cell.textLabel?.text = tableViewData[indexPath.section].title
                cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
            } else {
                if let _ = tableViewData[indexPath.section].sectionData {
                    cell.textLabel?.text = tableViewData[indexPath.section].sectionData![dataIndex]
                    cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .body)
                }
            }
        } else {
            cell.textLabel?.text = tableViewData[indexPath.section].title
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .body)
//            cell.textLabel?.attributedText = makeAttributedString(
        }
        return cell
    }
    @IBAction func closeTableCard(_ sender: Any) {
        DispatchQueue.global(qos: .background).async {

        // Background Thread

        DispatchQueue.main.async {
            self.navigationController?.navigationBar.isHidden = true
            }
        }
        performSegue(withIdentifier: "closeTableCard", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let _ = tableViewData[indexPath.section].sectionData {
            if indexPath.row == 0 {
                if tableViewData[indexPath.section].opened == true {
                    tableViewData[indexPath.section].opened = false
                } else {
                    tableViewData[indexPath.section].opened = true
                }
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .automatic)
            } else {
               performSegue(withIdentifier: "showDetail", sender: nil)
            }
        } else {
            performSegue(withIdentifier: "showDetail", sender: nil)
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

    @IBAction func tapforsources(_ sender: Any) {
        performSegue(withIdentifier: "showTableSources", sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetail" {
            let destVC = segue.destination as! MoreDetailsViewController
            let indexPath = tableView.indexPathForSelectedRow
            if let _ = tableViewData[indexPath!.section].sectionData {
                destVC.titleName = HazeTableArray[selectedTableHazeCard!-1].data[indexPath!.section].items![indexPath!.row-1]
                destVC.content = HazeTableArray[selectedTableHazeCard!-1].data[indexPath!.section].itemContents![indexPath!.row-1].content
                if let videoLink = HazeTableArray[selectedTableHazeCard!-1].data[indexPath!.section].itemContents![indexPath!.row-1].videoLink {
                    destVC.videoLink = videoLink
                }
                if let imageName = HazeTableArray[selectedTableHazeCard!-1].data[indexPath!.section].itemContents![indexPath!.row-1].imageNames {
                    destVC.imageName = imageName
                }
                if let videoPlayerFileName = HazeTableArray[selectedTableHazeCard!-1].data[indexPath!.section].itemContents![indexPath!.row-1].animationName {
                    destVC.animationName = videoPlayerFileName
                }
                if let videoPlayerFileType = HazeTableArray[selectedTableHazeCard!-1].data[indexPath!.section].itemContents![indexPath!.row-1].animationFileType {
                    destVC.animationFileType = videoPlayerFileType
                }
                if let bgImageName = HazeTableArray[selectedTableHazeCard!-1].data[indexPath!.section].itemContents![indexPath!.row-1].backgroundImageName {
                    destVC.backgroundImageName = bgImageName
                }
            } else {
                destVC.titleName = HazeTableArray[selectedTableHazeCard!-1].data[indexPath!.section].header
                destVC.content = HazeTableArray[selectedTableHazeCard!-1].data[indexPath!.section].headerContents!.content
                if let videoLink = HazeTableArray[selectedTableHazeCard!-1].data[indexPath!.section].headerContents!.videoLink {
                    destVC.videoLink = videoLink
                }
                if let imageName = HazeTableArray[selectedTableHazeCard!-1].data[indexPath!.section].headerContents!.imageNames {
                    destVC.imageName = imageName
                }
                if let videoPlayerFileName = HazeTableArray[selectedTableHazeCard!-1].data[indexPath!.section].headerContents!.animationName {
                    destVC.animationName = videoPlayerFileName
                }
                if let videoPlayerFileType = HazeTableArray[selectedTableHazeCard!-1].data[indexPath!.section].headerContents!.animationFileType {
                    destVC.animationFileType = videoPlayerFileType
                }
                if let bgImageName = HazeTableArray[selectedTableHazeCard!-1].data[indexPath!.section].headerContents!.backgroundImageName {
                    destVC.backgroundImageName = bgImageName
                }
            }
        } else if segue.identifier == "showTableSources" {
            let destVC = segue.destination as! SourcesTableViewController
            destVC.sourcesData = HazeTableArray[selectedTableHazeCard!-1].sourcesName
            destVC.sourcesLinks = HazeTableArray[selectedTableHazeCard!-1].sources
        }
    }

}
