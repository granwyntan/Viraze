//
//  HomeViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 14/8/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit

var selectedHazeCard: Int?
var selectedTableHazeCard: Int?
var selectedVirusCard: Int?

class HomeViewController: UIViewController/*, UIViewControllerTransitioningDelegate*/ {
    @IBOutlet weak var greeting: UIButton!
    @IBOutlet weak var greetingText: UILabel!
    @IBOutlet weak var hazeLabel: UILabel!
    @IBOutlet weak var hazePic: UIImageView!
    @IBOutlet weak var coronavirusLabel: UILabel!
    @IBOutlet weak var coronavirusPic: UIImageView!
    var hasBeenPressed = false
    var greetingPrefix = "Hello"
    @IBOutlet weak var haze1: UIButton!
    @IBOutlet weak var haze2: UIButton!
    @IBOutlet weak var haze3: UIButton!
    @IBOutlet weak var haze4: UIButton!
    @IBOutlet weak var haze5: UIButton!
    @IBOutlet weak var haze6: UIButton!
    @IBOutlet weak var haze7: UIButton!
    @IBOutlet weak var haze8: UIButton!
    @IBOutlet weak var haze9: UIButton!
    @IBOutlet weak var allquiz: UIButton!
    @IBOutlet weak var virusQuiz: UIButton!
    @IBOutlet weak var hazeQuiz: UIButton!
    @IBOutlet weak var chooseMask: UIButton!
    @IBOutlet weak var browseMask: UIButton!
    @IBOutlet weak var coronavirus1: UIButton!
    @IBOutlet weak var coronavirus2: UIButton!
    @IBOutlet weak var coronavirus3: UIButton!
    @IBOutlet weak var coronavirus4: UIButton!
    @IBOutlet weak var coronavirus5: UIButton!
    @IBOutlet weak var coronavirus6: UIButton!
    @IBOutlet weak var coronavirus7: UIButton!
    @IBOutlet weak var coronavirus8: UIButton!
    @IBOutlet weak var coronavirus9: UIButton!
    @IBOutlet weak var coronavirus10: UIButton!
    @IBOutlet weak var textview: UITextView!
    
    var timeLeft = 1.0
    var imageName = UIImage()
    let defaults = UserDefaults.standard
    var timer: Timer?
    var transition = CircularTransistion()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        hazePic.alpha = 0.75

        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        
        // navigationController?.navigationBar.backgroundColor = .systemGreen
        // image.clipsToBounds = true
        // image.contentMode = .scaleAspectFit
        defaults.setValue("HomeThing", forKey: "LaunchViewController")
        coronavirus1.contentMode = .scaleAspectFill
        coronavirus1.layoutIfNeeded()
        coronavirus1.subviews.first?.contentMode = .scaleAspectFill
        coronavirus2.contentMode = .scaleAspectFill
        coronavirus2.layoutIfNeeded()
        coronavirus2.subviews.first?.contentMode = .scaleAspectFill
        coronavirus3.contentMode = .scaleAspectFill
        coronavirus3.layoutIfNeeded()
        coronavirus3.subviews.first?.contentMode = .scaleAspectFill
        coronavirus4.contentMode = .scaleAspectFill
        coronavirus4.layoutIfNeeded()
        coronavirus4.subviews.first?.contentMode = .scaleAspectFill
        coronavirus5.contentMode = .scaleAspectFill
        coronavirus5.layoutIfNeeded()
        coronavirus5.subviews.first?.contentMode = .scaleAspectFill
        coronavirus7.contentMode = .scaleAspectFill
        coronavirus7.layoutIfNeeded()
        coronavirus7.subviews.first?.contentMode = .scaleAspectFill
        coronavirus6.contentMode = .scaleAspectFill
        coronavirus6.layoutIfNeeded()
        coronavirus6.subviews.first?.contentMode = .scaleAspectFill
        coronavirus8.contentMode = .scaleAspectFill
        coronavirus8.layoutIfNeeded()
        coronavirus8.subviews.first?.contentMode = .scaleAspectFill
        coronavirus9.contentMode = .scaleAspectFill
        coronavirus9.layoutIfNeeded()
        coronavirus9.subviews.first?.contentMode = .scaleAspectFill
        coronavirus10.contentMode = .scaleAspectFill
        coronavirus10.layoutIfNeeded()
        coronavirus10.subviews.first?.contentMode = .scaleAspectFill
        haze1.contentMode = .scaleAspectFill
        haze1.layoutIfNeeded()
        haze1.subviews.first?.contentMode = .scaleAspectFill
        haze2.contentMode = .scaleAspectFill
        haze2.layoutIfNeeded()
        haze2.subviews.first?.contentMode = .scaleAspectFill
        haze3.contentMode = .scaleAspectFill
        haze3.layoutIfNeeded()
        haze3.subviews.first?.contentMode = .scaleAspectFill
        haze4.contentMode = .scaleAspectFill
        haze4.layoutIfNeeded()
        haze4.subviews.first?.contentMode = .scaleAspectFill
        haze5.contentMode = .scaleAspectFill
        haze5.layoutIfNeeded()
        haze5.subviews.first?.contentMode = .scaleAspectFill
        haze7.contentMode = .scaleAspectFill
        haze7.layoutIfNeeded()
        haze7.subviews.first?.contentMode = .scaleAspectFill
        haze6.contentMode = .scaleAspectFill
        haze6.layoutIfNeeded()
        haze6.subviews.first?.contentMode = .scaleAspectFill
        haze8.contentMode = .scaleAspectFill
        haze8.layoutIfNeeded()
        haze8.subviews.first?.contentMode = .scaleAspectFill
        haze9.contentMode = .scaleAspectFill
        haze9.layoutIfNeeded()
        haze9.subviews.first?.contentMode = .scaleAspectFill
        browseMask.layoutIfNeeded()
        browseMask.subviews.first?.contentMode = .scaleAspectFill
        browseMask.backgroundColor = .white
        browseMask.layer.cornerRadius = 10
        browseMask.clipsToBounds = true
        browseMask.layer.borderWidth = 0.5
        browseMask.layer.borderColor = UIColor.label.cgColor
        chooseMask.layoutIfNeeded()
        chooseMask.subviews.first?.contentMode = .scaleAspectFill
        allquiz.layoutIfNeeded()
        allquiz.subviews.first?.contentMode = .scaleAspectFill
        chooseMask.backgroundColor = .white
        chooseMask.layer.cornerRadius = 10
        chooseMask.clipsToBounds = true
        chooseMask.layer.borderWidth = 0.5
        chooseMask.layer.borderColor = UIColor.label.cgColor
        haze1.layer.cornerRadius = 10
        haze2.layer.cornerRadius = 10
        haze3.layer.cornerRadius = 10
        haze4.layer.cornerRadius = 10
        haze5.layer.cornerRadius = 10
        haze6.layer.cornerRadius = 10
        haze7.layer.cornerRadius = 10
        haze8.layer.cornerRadius = 10
        haze9.layer.cornerRadius = 10
        haze1.clipsToBounds = true
        haze2.clipsToBounds = true
        haze3.clipsToBounds = true
        haze4.clipsToBounds = true
        haze5.clipsToBounds = true
        haze6.clipsToBounds = true
        haze7.clipsToBounds = true
        haze8.clipsToBounds = true
        haze9.clipsToBounds = true
        coronavirus1.layer.cornerRadius = 10
        coronavirus2.layer.cornerRadius = 10
        coronavirus3.layer.cornerRadius = 10
        coronavirus4.layer.cornerRadius = 10
        coronavirus5.layer.cornerRadius = 10
        coronavirus6.layer.cornerRadius = 10
        coronavirus7.layer.cornerRadius = 10
        coronavirus8.layer.cornerRadius = 10
        coronavirus9.layer.cornerRadius = 10
        coronavirus10.layer.cornerRadius = 10
        coronavirus1.clipsToBounds = true
        coronavirus2.clipsToBounds = true
        coronavirus3.clipsToBounds = true
        coronavirus4.clipsToBounds = true
        coronavirus5.clipsToBounds = true
        coronavirus6.clipsToBounds = true
        coronavirus7.clipsToBounds = true
        coronavirus8.clipsToBounds = true
        coronavirus9.clipsToBounds = true
        coronavirus10.clipsToBounds = true
        textview.contentMode = .bottomLeft
//        hazeQuiz.alpha = 0.95
        hazeQuiz.layer.cornerRadius = 10
        hazeQuiz.clipsToBounds = true
//        virusQuiz.alpha = 0.95
        virusQuiz.layer.cornerRadius = 10
        virusQuiz.clipsToBounds = true
//        allquiz.alpha = 0.95
        allquiz.layer.cornerRadius = 10
        allquiz.clipsToBounds = true
        virusQuiz.layer.borderWidth = 0.5
        virusQuiz.layer.borderColor = UIColor.label.cgColor
        hazeQuiz.layer.borderWidth = 0.5
        hazeQuiz.layer.borderColor = UIColor.label.cgColor
        allquiz.layer.borderWidth = 0.5
        allquiz.layer.borderColor = UIColor.label.cgColor
    }

//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        transition.transitionMode = .present
//        transition.startingPoint = self.view.center
//        transition.circleColor = .lightGray //haze1.backgroundColor!
//        return transition
//    }
//
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        transition.transitionMode = .dismiss
//        transition.startingPoint = self.view.center
//        transition.circleColor = .lightGray //self.view.backgroundColor!
//        return transition
//    }
//    @IBAction func openCard(_ sender: UIButton) {
//        title = ""
//        let thing = UIButton(type: .system)
//        thing.isHidden = false
//        thing.frame = CGRect(x: sender.layer.position.x, y: sender.layer.position.y, width: sender.layer.frame.width, height: sender.layer.frame.height)
//        thing.setBackgroundImage(sender.backgroundImage(for: .normal), for: .normal)
//        thing.contentMode = .scaleAspectFill
//        view.addSubview(thing)
//        self.view = view
//        imageName = sender.backgroundImage(for: .normal)!
//        UIView.animate(withDuration: 0.1, delay: 0.0, animations: {
//            // first thing to animate
//            thing.transform = thing.transform
//                .scaledBy(x: self.view.frame.width/sender.layer.frame.width * 2, y: self.view.frame.height/sender.layer.frame.height * 2)
//        }) { (_) in
//            // this runs after the first animation completes
//            // we run *another* animation
////                UIView.animate(withDuration: 0.1) {
////                    self.counterLabel.transform = self.counterLabel.transform
////                        .scaledBy(x: 0.95, y: 0.95)
////                    }
//            thing.isUserInteractionEnabled = false
//            self.view.isUserInteractionEnabled = false
//            if let titleThing = sender.titleLabel?.text {
//                self.title = titleThing
//            } else {
//                self.title = "OwO"
//            }
////            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
//            self.performSegue(withIdentifier: "showCardDetail", sender: nil)
//            self.title = "Home"
//            self.view.isUserInteractionEnabled = true
//            // thing.isHidden = true
//        }
//    }
//    @IBAction func seeHaze(_ sender: Any) {
//        performSegue(withIdentifier: "hazeDefinition", sender: nil)
//    }
    var newtitle: String?

    @IBAction func tapCard(_ sender: UIButton) {
//        if hasBeenPressed == false {
        if sender == haze1 || sender == haze3 || sender == haze4 {
            if sender == haze1 {
                selectedHazeCard = 1
            } else if sender == haze3 {
                selectedHazeCard = 2
            } else if sender == haze4 {
                selectedHazeCard = 3
            }
            performSegue(withIdentifier: "cardWithoutTable", sender: nil)
        } else if sender == haze2 || sender == haze5 || sender == haze6 {
            if sender == haze2 {
                selectedTableHazeCard = 1
            } else if sender == haze5 {
                selectedTableHazeCard = 2
            } else if sender == haze6 {
                selectedTableHazeCard = 3
            }
            performSegue(withIdentifier: "cardWithTable", sender: nil)
        } else if sender == haze7 {
            performSegue(withIdentifier: "seeHazeGuidelines", sender: nil)
        } else if sender == haze8 {
            performSegue(withIdentifier: "seeHazeFAQs", sender: nil)
        } else if sender == haze9 {
            performSegue(withIdentifier: "seeHazeRes", sender: nil)
        } else if sender == coronavirus1 || sender == coronavirus2 || sender == coronavirus4 || sender == coronavirus6 || sender == coronavirus7 || sender == coronavirus8 {
            if sender == coronavirus1 {
                selectedVirusCard = 1
            } else if sender == coronavirus2 {
                selectedVirusCard = 2
            } else if sender == coronavirus4 {
                selectedVirusCard = 3
            } else if sender == coronavirus6 {
                selectedVirusCard = 5
            } else if sender == coronavirus7 {
                selectedVirusCard = 4
            } else if sender == coronavirus8 {
                selectedVirusCard = 6
            }
            performSegue(withIdentifier: "seeTableVirus", sender: nil)
        } else if sender == coronavirus3 {
            performSegue(withIdentifier: "seePreventionVirus", sender: nil)
        } else if sender == coronavirus5 {
            performSegue(withIdentifier: "seeTreatmentVirus", sender: nil)
        } else if sender == coronavirus9 {
            performSegue(withIdentifier: "moreVirus", sender: nil)
        } else if sender == browseMask {
            performSegue(withIdentifier: "browseMasks", sender: nil)
        } else if sender == chooseMask {
            performSegue(withIdentifier: "pickAMask", sender: nil)
        } else if sender == virusQuiz || sender == hazeQuiz || sender == allquiz {
            if sender == virusQuiz {
                newtitle = "Virus Quiz"
            } else if sender == hazeQuiz {
                newtitle = "Haze Quiz"
            } else if sender == allquiz {
                newtitle = "Viraze Quiz"
            }
            performSegue(withIdentifier: "seeQuiz", sender: nil)
        }
    }
    
    
    @IBAction func settingsScreen(_ sender: Any) {
        performSegue(withIdentifier: "seeSettings", sender: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        hasBeenPressed = false
        greeting.frame = CGRect(x: greetingText.layer.position.x, y: greetingText.layer.position.y, width: greetingText.layer.frame.width, height: greetingText.layer.frame.height)
        greeting.center = greetingText.center
        print(Calendar.current.component(.hour, from: Date()))
        if Calendar.current.component(.hour, from: Date()) >= 5 && Calendar.current.component(.hour, from: Date()) < 12 {
            greetingPrefix = "Good Morning"
        } else if Calendar.current.component(.hour, from: Date()) >= 12 && Calendar.current.component(.hour, from: Date()) < 18 {
            greetingPrefix = "Good Afternoon"
        } else if Calendar.current.component(.hour, from: Date()) >= 18 && Calendar.current.component(.hour, from: Date()) < 23 {
            greetingPrefix = "Good Evening"
        } else {
            greetingPrefix = "Hello"
        }
        if let name = defaults.string(forKey: "UserName") {
            greetingText.text = "\(greetingPrefix), \(name)"
        } else {
            greetingText.text = "\(greetingPrefix)"
        }
    }
    
    @IBAction func prepareForUnwind (segue: UIStoryboardSegue){
        
    }
    @IBAction func tapUser(_ sender: Any) {
        performSegue(withIdentifier: "seeChangeName", sender: nil)
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        // self.hidesBottomBarWhenPushed = true
//        if segue.identifier == "hazeDefinition" {
//            let destVC = segue.destination as! CardDetailViewController
////            destVC.title = title
////            destVC.backgroundName = imageName
//            destVC.transitioningDelegate = self
//            destVC.modalPresentationStyle = .custom
//        }
        if segue.identifier == "seeQuiz" {
            let navVC = segue.destination as? UINavigationController
            let destVC = navVC?.viewControllers.first as! McqMainViewController
            destVC.title = newtitle
        }
    }

}
