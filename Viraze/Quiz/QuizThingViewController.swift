//
//  QuizThingViewController.swift
//  Quiz App
//
//  Created by Granwyn Tan on 27/5/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit

class QuizThingViewController: UIViewController {
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var scoreText: UILabel!
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var currentQn: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
//    var timer: Timer?
//    var timeElapsed = 0.0
    var score = 0
    var isLastQuestion = false
    
    let timeAllowed = 20
    let totalQns:UInt32 = 10

    var currentQuestion = 0
    var correctAns = 1
    var timeLeft = -1
    var tt : Timer!
    
//    enum OptionChoice {
//        case one
//        case two
//        case three
//        case four
//    }
//
//    struct Questions {
//        var question: String
//        var choice1: String
//        var choice2: String
//        var choice3: String
//        var choice4: String
//        var correctChoice: OptionChoice
//    }
//
//    Questions(question: "What does % mean?", choice1: "Percent", choice2: "Modulo/Remainder", choice3: "Zero divided by Zero", choice4: "Two Eyes and One Nose", correctChoice: .two), Questions(question: "Who is apple's CEO?", choice1: "Tim Cook", choice2: "Satya Nadella", choice3: "Sundar Pichai", choice4: "Jeff Bezos", correctChoice: .one), Questions(question: "How to declare a mutable variable", choice1: "let", choice2: "Just assign value to variable", choice3: "const", choice4: "var", correctChoice: .four), Questions(question: "What language do you use to program in the Xcode IDE?", choice1: "JavaScript", choice2: "Python", choice3: "Swift", choice4: "Dart", correctChoice: .three)
    var quizzes = [QuizQuestion]()
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialiseQuiz()
        choice1.layer.cornerRadius = 10
        choice2.layer.cornerRadius = 10
        choice3.layer.cornerRadius = 10
        choice4.layer.cornerRadius = 10
        scoreText.text = "Score: \(score)"
        choice1.titleEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        choice2.titleEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        choice3.titleEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        choice4.titleEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
//        choice1.layer.borderWidth = 1
//        choice1.layer.borderWidth = 1
//        choice1.layer.borderWidth = 1
//        choice1.layer.borderWidth = 1
//        timer = Timer.scheduledTimer(timeInterval:0.1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
//    @objc func updateCounter() {
//        timeElapsed += 0.1
//    }
    fileprivate func checkAnswer(against option: OptionChoice, sender: UIButton) {
        if currentQuestion != quizzes.count {
            if quizzes[currentQuestion].correctChoice == option {
                score += 1
                scoreText.text = "Score: \(score)"
                sender.layer.borderColor = UIColor.systemGreen.cgColor
                sender.layer.borderWidth = 3
            } else {
                sender.layer.borderColor = UIColor.systemRed.cgColor
                sender.layer.borderWidth = 3
                switch quizzes[currentQuestion].correctChoice {
                    case .one:
                        choice1.layer.borderColor = UIColor.systemGreen.cgColor
                        choice1.layer.borderWidth = 3
                    case .two:
                        choice2.layer.borderColor = UIColor.systemGreen.cgColor
                        choice2.layer.borderWidth = 3
                    case .three:
                        choice3.layer.borderColor = UIColor.systemGreen.cgColor
                        choice3.layer.borderWidth = 3
                    case .four:
                        choice4.layer.borderColor = UIColor.systemGreen.cgColor
                        choice4.layer.borderWidth = 3
                }
            }
            if timeAllowed > 0 { tt.invalidate() }
            hideBtn(hide: false)
        }
    }
    
    @IBAction func nextQuestion(_ sender: Any) {
        if currentQuestion < quizzes.count-1 {
            currentQuestion += 1
            displayQuestion()
        } else {
            let alert = UIAlertController(title: "Quiz Completed", message: "You scored \(score)/\(quizzes.count)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Go Again", style: .default, handler: { action in self.initialiseQuiz()}))
            alert.addAction(UIAlertAction(title: "Quit", style: .cancel, handler: { action in self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func hideBtn(hide: Bool) {
        choice1.isEnabled = hide
        choice2.isEnabled = hide
        choice3.isEnabled = hide
        choice4.isEnabled = hide
        nextButton.isHidden = hide
    }
    
//    func initQuiz() {
//        score = 0
//        currentQuestion = 0
////        quizzes.removeAll(keepingCapacity: false)
////        var temp = 0
////        while temp<qnsAsked {
////            var unique = false
////            while !unique {
////                let randnum = Int(arc4random_uniform(totalQns))
////                if qnsList.contains(randnum) {
////                    continue
////                }
////                else {
////                    unique = true
////                    temp += 1
////                    qnsList.append(randnum)
////                }
////            }
////        }
//        if timeAllowed > 0 {
//            timeLabel.text = "\(timeAllowed)"
//        }
//        else {
//            timeLabel.text = "--"
//        }
////        displayQns(qNo: qnsList[curQns])
//
//    }

    @IBAction func choice1Pressed(_ sender: UIButton) {
        checkAnswer(against: .one, sender: sender)
    }

    @IBAction func choice2Pressed(_ sender: UIButton) {
        checkAnswer(against: .two, sender: sender)
    }

    @IBAction func choice3Pressed(_ sender: UIButton) {
        checkAnswer(against: .three, sender: sender)
    }
    
    @IBAction func cancel(_ sender: Any) {
        let alert = UIAlertController(title: "Options", message: "Choose what to do next", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Leave/Quit Quiz", style: .default, handler: { action in
            let alert2 = UIAlertController(title: "Are you sure you want to Leave/Quit Quiz", message: "Your current progress will be lost", preferredStyle: .alert)
            alert2.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in self.navigationController?.popViewController(animated: true)
            }))
            alert2.addAction(UIAlertAction(title: "No", style: .destructive, handler: nil))
            self.present(alert2, animated: true, completion: nil)
        }
        ))
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { action in
            let alert2 = UIAlertController(title: "Are you sure you want to Restart Quiz", message: "Your current progress will be lost", preferredStyle: .alert)
                alert2.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in
                    self.currentQuestion = 0
                    self.displayQuestion()
                }))
                alert2.addAction(UIAlertAction(title: "No", style: .destructive, handler: nil))
            self.present(alert2, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        self.present(alert,animated: true, completion: nil)
    }

    @IBAction func choice4Pressed(_ sender: UIButton) {
        checkAnswer(against: .four, sender: sender)
    }

    func nextQuestion(){
        currentQuestion += 1
        if currentQuestion < quizzes.count {
            displayQuestion()
        }
    }
    
    @objc func updateTimer() {
        timeLeft -= 1
        if timeLeft > 0 {
            timeLabel.text = "Time Left: \(timeLeft)"
        }
        else {
            timeLabel.text = "Time Left: 0"
            tt.invalidate()
            switch quizzes[currentQuestion].correctChoice {
                case .one:
                    choice1.layer.borderColor = UIColor.systemGreen.cgColor
                case .two:
                    choice2.layer.borderColor = UIColor.systemGreen.cgColor
                case .three:
                    choice4.layer.borderColor = UIColor.systemGreen.cgColor
                case .four:
                    choice4.layer.borderColor = UIColor.systemGreen.cgColor
            }
            hideBtn(hide: false)
        }
    }
    
    func displayQuestion() {
        
        choice1.layer.borderWidth = 0
        choice2.layer.borderWidth = 0
        choice3.layer.borderWidth = 0
        choice4.layer.borderWidth = 0
//        choice1.titleLabel?.adjustsFontSizeToFitWidth = true
//        choice2.titleLabel?.adjustsFontSizeToFitWidth = true
//        choice3.titleLabel?.adjustsFontSizeToFitWidth = true
//        choice4.titleLabel?.adjustsFontSizeToFitWidth = true
        choice1.titleLabel?.numberOfLines = 0; // Dynamic number of lines
        choice1.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        choice2.titleLabel?.numberOfLines = 0; // Dynamic number of lines
        choice2.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        choice3.titleLabel?.numberOfLines = 0; // Dynamic number of lines
        choice3.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        choice4.titleLabel?.numberOfLines = 0; // Dynamic number of lines
        choice4.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        currentQn.text = "Q\(currentQuestion+1)/\(quizzes.count)"
        let question = quizzes[currentQuestion]
        questionText.text = question.question
        choice1.setTitle(question.choice1, for: .normal)
        choice2.setTitle(question.choice2, for: .normal)
        choice3.setTitle(question.choice3, for: .normal)
        choice4.setTitle(question.choice4, for: .normal)
        choice1.layer.borderColor = UIColor.label.cgColor
        choice2.layer.borderColor = UIColor.label.cgColor
        choice3.layer.borderColor = UIColor.label.cgColor
        choice4.layer.borderColor = UIColor.label.cgColor
        hideBtn(hide: true)
        if timeAllowed > 0 {
            timeLeft = timeAllowed
            timeLabel.text = "Time Left: \(timeLeft)"
            tt = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }


    func initialiseQuiz(){
        score = 0
        currentQuestion = 0
        displayQuestion()
        if timeAllowed > 0 {
            timeLabel.text = "Time Left: \(timeAllowed)"
        }
        else {
            timeLabel.text = "--"
        }
    }

    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        <#code#>
    }
     */
}

