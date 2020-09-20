//
//  GameEndedViewController.swift
//  Quiz App
//
//  Created by Granwyn Tan on 2/6/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit

class GameEndedViewController: UIViewController {

    @IBOutlet weak var startover: UIButton!
    @IBOutlet weak var backtohome: UIButton!
    @IBOutlet weak var scoreText: UILabel!
    var score: Int?
    var comment = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.setHidesBackButton(true, animated: false)
        startover.layer.cornerRadius = 15
        // startover.isHidden = true
        backtohome.layer.cornerRadius = 15
        // backtohome.isHidden = true
        if score! == 0 {
            comment = "Try Harder Next Time."
        } else if score! <= 3 {
            comment = "You can do it."
        } else if score! < 5 {
            comment = "Almost There"
        } else {
            comment = "Well Done!"
        }
        scoreText.text = "\(comment)\nYour total score is: \(score!)/5"
    }
    
    @IBAction func startagain(_ sender: Any) {
        performSegue(withIdentifier: "startover", sender: nil)
    }
    @IBAction func backtohome(_ sender: Any) {
        performSegue(withIdentifier: "unwindToHome", sender: self)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
//        if segue.identifier == "startover" {
//            let destVC = segue.destination as! QuizThingViewController
//            destVC.currentQuestion = 0
//        }
    }

}
