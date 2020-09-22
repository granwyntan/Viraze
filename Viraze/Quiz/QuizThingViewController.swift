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
    @IBOutlet weak var curvedThing: UILabel!
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
    var selectedButton: UIButton?
    
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
    @IBOutlet weak var submitAnsButton: UIButton!
    var selectedOption: OptionChoice?
    var selections = [false, false, false, false]
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    @IBOutlet weak var headerthing: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        navigationController?.navigationItem.hidesBackButton = true
        navigationItem.hidesBackButton = true
        submitAnsButton.setTitleColor(.systemGray4, for: .disabled)
        initialiseQuiz()
        submitAnsButton.isEnabled = false
        curvedThing.layer.cornerRadius = 10
        curvedThing.layer.masksToBounds = true
        choice1.layer.cornerRadius = 10
        choice2.layer.cornerRadius = 10
        choice3.layer.cornerRadius = 10
        choice4.layer.cornerRadius = 10
        scoreText.text = "Score: \(score)"
        choice1.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        choice2.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        choice3.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        choice4.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        var textAttributes = [NSAttributedString.Key: UIColor]()
        if self.title == "Haze Quiz" {
            headerthing.backgroundColor = .gray
            textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        } else if self.title == "Virus Quiz" {
            headerthing.backgroundColor = .systemGreen
            textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        } else if self.title == "Viraze Quiz" {
            headerthing.backgroundColor = .systemBlue
            textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.label]
        }
        navigationController?.navigationBar.titleTextAttributes = textAttributes
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
                sender.backgroundColor = UIColor.systemGreen
//                sender.layer.borderWidth = 3
            } else {
                sender.backgroundColor = UIColor.systemRed
//                sender.layer.borderWidth = 3
                switch quizzes[currentQuestion].correctChoice {
                    case .one:
                        choice1.backgroundColor = UIColor.systemGreen
//                        choice1.layer.borderWidth = 3
                    case .two:
                        choice2.backgroundColor = UIColor.systemGreen
//                        choice2.layer.borderWidth = 3
                    case .three:
                        choice3.backgroundColor = UIColor.systemGreen
//                        choice3.layer.borderWidth = 3
                    case .four:
                        choice4.backgroundColor = UIColor.systemGreen
                        // choice4.layer.borderWidth = 3
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
            nextButton.isHidden = true
            submitAnsButton.isHidden = false
        } else {
//            let alert = UIAlertController(title: "Quiz Completed", message: "You scored \(score)/\(quizzes.count)", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Go Again", style: .default, handler: { action in self.initialiseQuiz()}))
//            alert.addAction(UIAlertAction(title: "Quit", style: .cancel, handler: { action in
//                self.dismiss(animated: true, completion: nil)
//            }))
//            self.present(alert, animated: true, completion: nil)
            self.performSegue(withIdentifier: "gameEnded", sender: nil)
        }
    }
    
    func hideBtn(hide: Bool) {
        choice1.isEnabled = hide
        choice2.isEnabled = hide
        choice3.isEnabled = hide
        choice4.isEnabled = hide
        nextButton.isHidden = hide
    }
    
    @IBAction func submitAnswer(_ sender: Any) {
        checkAnswer(against: selectedOption!, sender: selectedButton!)
        nextButton.isHidden = false
        submitAnsButton.isHidden = true
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
    
    func selectQuestion(for option: OptionChoice, sender: UIButton) {
        var buttonNumber = Int()
        if sender == choice1 {
            buttonNumber = 0
        } else if sender == choice2 {
            buttonNumber = 1
        } else if sender == choice3 {
            buttonNumber = 2
        } else if sender == choice4 {
            buttonNumber = 3
        }
        if selections[buttonNumber] == false {
            switch sender{
                case choice1:
                    choice1.backgroundColor = .systemBlue
                    choice2.backgroundColor = .label
                    choice3.backgroundColor = .label
                    choice4.backgroundColor = .label
                case choice2:
                    choice1.backgroundColor = .label
                    choice2.backgroundColor = .systemBlue
                    choice3.backgroundColor = .label
                    choice4.backgroundColor = .label
                case choice3:
                    choice1.backgroundColor = .label
                    choice2.backgroundColor = .label
                    choice3.backgroundColor = .systemBlue
                    choice4.backgroundColor = .label
                case choice4:
                    choice1.backgroundColor = .label
                    choice2.backgroundColor = .label
                    choice3.backgroundColor = .label
                    choice4.backgroundColor = .systemBlue
                default:
                    return
            }
            selectedOption = option
            selectedButton = sender
            selections[buttonNumber] = true
        } else if selections[buttonNumber] == true {
            sender.backgroundColor = .label
            selectedOption = nil
            selectedButton = nil
            selections[buttonNumber] = false
        }
        submitAnsButton.isEnabled = selections[buttonNumber]
    }
    @IBAction func clickOption(_ sender: UIButton) {
        if sender == choice1 {
            selectQuestion(for: .one, sender: sender)
        } else if sender == choice2 {
            selectQuestion(for: .two, sender: sender)
        } else if sender == choice3 {
            selectQuestion(for: .three, sender: sender)
        } else if sender == choice4 {
            selectQuestion(for: .four, sender: sender)
        }
    }
    
//    @IBAction func choice1Pressed(_ sender: UIButton) {
//        checkAnswer(against: .one, sender: sender)
//
//    }
//
//    @IBAction func choice2Pressed(_ sender: UIButton) {
//        checkAnswer(against: .two, sender: sender)
//    }
//
//    @IBAction func choice3Pressed(_ sender: UIButton) {
//        checkAnswer(against: .three, sender: sender)
//    }
    
    @IBAction func close(_ sender: Any) {
        performSegue(withIdentifier: "closeQuiz1", sender: nil)
    }
    @IBAction func cancel(_ sender: Any) {
        tt.invalidate()
        let alert = UIAlertController(title: "Options", message: "Choose what to do next", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Leave/Quit Quiz", style: .default, handler: { action in
            let alert2 = UIAlertController(title: "Are you sure you want to Leave/Quit Quiz", message: "Your current progress will be lost", preferredStyle: .alert)
            alert2.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in self.navigationController?.popViewController(animated: true)
            }))
            alert2.addAction(UIAlertAction(title: "No", style: .default, handler: {
                action in
                self.tt = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
            }))
            self.present(alert2, animated: true, completion: nil)
        }
        ))
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { action in
            let alert2 = UIAlertController(title: "Are you sure you want to Restart Quiz", message: "Your current progress will be lost", preferredStyle: .alert)
                alert2.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in
                    self.currentQuestion = 0
                    self.displayQuestion()
                }))
            alert2.addAction(UIAlertAction(title: "No", style: .destructive, handler: {
                action in
                self.tt = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
            }))
            self.present(alert2, animated: true){
                alert2.view.superview?.isUserInteractionEnabled = true
                alert2.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertControllerBackgroundTapped)))
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: {
            action in
            self.tt = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        }))
        self.present(alert, animated: true){
    alert.view.superview?.isUserInteractionEnabled = true
    alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertControllerBackgroundTapped)))
}
    }
@objc func alertControllerBackgroundTapped()
{
    self.dismiss(animated: true, completion: nil)
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
            nextButton.isHidden = false
            submitAnsButton.isHidden = true
            timeLabel.text = "Time Left: 0"
            tt.invalidate()
            switch quizzes[currentQuestion].correctChoice {
                case .one:
                    choice1.backgroundColor = UIColor.systemGreen
                case .two:
                    choice2.backgroundColor = UIColor.systemGreen
                case .three:
                    choice4.backgroundColor = UIColor.systemGreen
                case .four:
                    choice4.backgroundColor = UIColor.systemGreen
            }
            hideBtn(hide: false)
        }
    }
    
    func displayQuestion() {
//
//        choice1.layer.borderWidth = 0
//        choice2.layer.borderWidth = 0
//        choice3.layer.borderWidth = 0
//        choice4.layer.borderWidth = 0
        choice1.titleLabel?.adjustsFontSizeToFitWidth = true
        choice2.titleLabel?.adjustsFontSizeToFitWidth = true
        choice3.titleLabel?.adjustsFontSizeToFitWidth = true
        choice4.titleLabel?.adjustsFontSizeToFitWidth = true
//        choice1.titleLabel?.numberOfLines = 0; // Dynamic number of lines
//        choice1.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
//        choice2.titleLabel?.numberOfLines = 0; // Dynamic number of lines
//        choice2.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
//        choice3.titleLabel?.numberOfLines = 0; // Dynamic number of lines
//        choice3.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
//        choice4.titleLabel?.numberOfLines = 0; // Dynamic number of lines
//        choice4.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        selections = [false, false, false, false]
        currentQn.text = "Q\(currentQuestion+1)/\(quizzes.count)"
        let question = quizzes[currentQuestion]
        questionText.text = question.question
        choice1.setTitle(question.choice1, for: .normal)
        choice2.setTitle(question.choice2, for: .normal)
        choice3.setTitle(question.choice3, for: .normal)
        choice4.setTitle(question.choice4, for: .normal)
        choice1.backgroundColor = .label
        choice2.backgroundColor = .label
        choice3.backgroundColor = .label
        choice4.backgroundColor = .label
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
            timeLabel.text = "Time Left:                    --"
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameEnded" {
            let destVC = segue.destination as! GameEndedViewController
            destVC.score = score
        }
    }
}

