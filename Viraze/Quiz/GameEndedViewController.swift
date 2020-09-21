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
    @IBOutlet weak var comment: UILabel!
    var score: Int?
    var commentThing = ""
    var thenewtextcolor = UIColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.setHidesBackButton(true, animated: false)
        startover.layer.cornerRadius = 15
        // startover.isHidden = true
        backtohome.layer.cornerRadius = 15
        // backtohome.isHidden = true
        if score! == 0 {
            thenewtextcolor = .systemRed
            commentThing = "Try Harder Next Time"
        } else if score! < 3 {
            thenewtextcolor = .systemOrange
            commentThing = "You can do it"
        } else if score! < 5 {
            thenewtextcolor = .systemYellow
            commentThing = "Almost There"
        } else {
            thenewtextcolor = .systemGreen
            commentThing = "Well Done"
        }
        scoreText.text = "Your total score is: \(score!)/5"
        comment.textColor = thenewtextcolor
        comment.text = commentThing
    }
    
    @IBAction func home(_ sender: Any) {
        performSegue(withIdentifier: "closeQuiz2", sender: nil)
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
