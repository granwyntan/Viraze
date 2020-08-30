//
//  TutorialViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 13/8/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    var seguePerformed = false
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var pagecontrol: UIPageControl!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var instructions: UILabel!
    @IBOutlet var longPress: UILongPressGestureRecognizer!
    
    struct TutorialStuff {
        var image: String
        var title: String
        var desc: String
    }
    var currentPage = 0
    
    let tutorials = [
        TutorialStuff(image: "image1", title: "Title 1", desc: "desc 1"),
        TutorialStuff(image: "image2", title: "Title 2", desc: "desc 2"),
        TutorialStuff(image: "image3", title: "Title 3", desc: "desc 3")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        defaults.setValue("TutorialViewController", forKey: "LaunchViewController")
        longPress.isEnabled = false
        self.navigationItem.hidesBackButton = true
        
        pagecontrol.numberOfPages = tutorials.count
        pagecontrol.currentPage = currentPage
        image.image = UIImage(named: tutorials[currentPage].image)
        titleLabel.text = tutorials[currentPage].title
        descriptionLabel.text = tutorials[currentPage].desc
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(nextTutorial))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(prevTutorial))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(nextTutorial))
        self.view.addGestureRecognizer(tap)
        
    }
    @IBAction func scroll(_ sender: Any) {
        currentPage = pagecontrol.currentPage
        image.image = UIImage(named: tutorials[currentPage].image)
        titleLabel.text = tutorials[currentPage].title
        descriptionLabel.text = tutorials[currentPage].desc
        if currentPage == 2 {
            instructions.text = "Long Press Anywhere to Continue"
            longPress.isEnabled = true
        } else {
            instructions.text = "Tap or Swipe to Navigate"
            longPress.isEnabled = false
        }
    }
    @objc func prevTutorial(){
        if currentPage > 0 {
            instructions.text = "Tap or Swipe to Navigate"
            currentPage -= 1
            image.image = UIImage(named: tutorials[currentPage].image)
            titleLabel.text = tutorials[currentPage].title
            descriptionLabel.text = tutorials[currentPage].desc
            pagecontrol.currentPage = currentPage
            longPress.isEnabled = false
        }
    }
    @objc func nextTutorial() {
        if currentPage < tutorials.count-1 {
            instructions.text = "Tap or Swipe to Navigate"
            currentPage += 1
            image.image = UIImage(named: tutorials[currentPage].image)
            titleLabel.text = tutorials[currentPage].title
            descriptionLabel.text = tutorials[currentPage].desc
            pagecontrol.currentPage = currentPage
            longPress.isEnabled = false
        }
        if currentPage == 2 {
            instructions.text = "Long Press Anywhere to Continue"
            longPress.isEnabled = true
        }
    }
    @IBAction func longPressed(_ sender: Any) {
        if seguePerformed == false {
            performSegue(withIdentifier: "setName", sender: nil)
            seguePerformed = true
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
