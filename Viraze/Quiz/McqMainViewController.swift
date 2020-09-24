//
//  McqMainViewController.swift
//  MCQTemplate
//
//  Created by Granwyn Tan on 20/9/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit
import AVFoundation

let defaults = UserDefaults.standard

var isNumbOfQn: Bool?
var numbOfQns = 5
var timeForQn = 20

class McqMainViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var questionNumberTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if isNumbOfQn == true {
            return choices.count
        }
        return choices2.count
    }
//    @IBAction func editingend(_ sender: Any) {
//        isNumbOfQn = nil
//        questionPickerView.reloadAllComponents()
//    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        questionNumberTextField.text = "Number of Questions: \(String(numbOfQns))"
        if isNumbOfQn == true {
            numbOfQns = Int(choices[row])
            loadStuff(item: .quizNumberOfQns)
            questionNumberTextField.attributedText = NSMutableAttributedString()
                    .bold("Number of Questions: ")
                    .normal("\(String(numbOfQns))")
        } else {
            timeForQn = Int(choices2[row])
            loadStuff(item: .quizTime)
            timeTextField.attributedText = timeForQn > 1 ? NSMutableAttributedString().bold("Time for Each Question: ").normal("\(String(timeForQn)) seconds") : NSMutableAttributedString().bold("Time for Each Question: ").normal("\(String(timeForQn)) second")
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if isNumbOfQn == true {
            return String(choices[row])
        }
        return String(choices2[row])
    }
    
    @IBAction func editingBegin(_ sender: Any) {
        isNumbOfQn = true
        questionPickerView.reloadAllComponents()
//        questionPickerView.selectRow(choices.firstIndex(of: numbOfQns)!, inComponent: 0, animated: true)
        createToolbar()
        loadStuff(item: .quizNumberOfQns)
    }
//    @IBAction func editingEnd(_ sender: Any) {
//        isNumbOfQn = nil
//        questionPickerView.reloadAllComponents()
//    }
    
    @IBAction func editingBegin2(_ sender: Any) {
        isNumbOfQn = false
        questionPickerView.reloadAllComponents()
//        questionPickerView.selectRow(choices2.firstIndex(of: timeForQn)!, inComponent: 0, animated: true)
        createToolbar()
        loadStuff(item: .quizTime)
    }
//    @IBAction func didEndOnExit(_ sender: UITextField) {
//        if sender == questionNumberTextField {
//            isNumbOfQn = true
//        } else {
//            isNumbOfQn = false
//        }
//        createToolbar()
//    }
    
    func createToolbar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
//        questionNumberTextField.text = "Number of Questions: \(String(numbOfQns))"
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        let thingLabel = UILabel()
        thingLabel.center = toolBar.center
        let flexibleSpace = UIBarButtonItem(
                                barButtonSystemItem: .flexibleSpace,
                                target: nil,
                                action: nil)
        thingLabel.font = UIFont.boldSystemFont(ofSize: 17)
        thingLabel.textAlignment = .center
        toolBar.isUserInteractionEnabled = true
        if isNumbOfQn == true {
            questionNumberTextField.attributedText = NSMutableAttributedString()
                    .bold("Number of Questions: ")
                    .normal("\(String(numbOfQns))")
            thingLabel.text = "Select Number of Questions"
            toolBar.setItems([doneButton, flexibleSpace, UIBarButtonItem(customView: thingLabel), flexibleSpace], animated: false)
            questionNumberTextField.inputAccessoryView = toolBar
            print(numbOfQns)
            questionPickerView.selectRow(choices.firstIndex(of: numbOfQns)!, inComponent: 0, animated: true)
        } else {
            timeTextField.attributedText = timeForQn > 1 ? NSMutableAttributedString().bold("Time for Each Question: ").normal("\(String(timeForQn)) seconds") : NSMutableAttributedString().bold("Time for Each Question: ").normal("\(String(timeForQn)) second")
            thingLabel.text = "Select Time for Each Question"
            questionPickerView.addSubview(thingLabel)
            toolBar.setItems([doneButton, flexibleSpace, UIBarButtonItem(customView: thingLabel), flexibleSpace], animated: false)
            timeTextField.inputAccessoryView = toolBar
            questionPickerView.selectRow(choices2.firstIndex(of: timeForQn)!, inComponent: 0, animated: true)
        }
    }
    
    struct video {
        var name: String
        var fileType: String
    }
    
    let choices = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15]
    let choices2 = [1, 2, 5, 10, 20, 30, 45]
    let videos_light = [
        video(name: "Virus (Light)", fileType: "mov"),
        video(name: "Haze (Light)", fileType: "mov")
    ]
    
    let videos_dark = [
        video(name: "Virus (Dark)", fileType: "mov"),
        video(name: "Haze (Dark)", fileType: "mov")
    ]
    
    var questionPickerView = UIPickerView()
    
//    @IBOutlet weak var setNumberOfQuestionsLabel: UILabel!
    @IBOutlet weak var videoBackgroundView: UIView!
    @IBOutlet weak var instructionsbutton: UIButton!
    @IBOutlet weak var startQuizButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timeTextField.tintColor = UIColor.clear
        questionNumberTextField.tintColor = UIColor.clear
        
        questionPickerView.delegate = self
        questionPickerView.dataSource = self
//        questionPickerView.selectRow(choices.firstIndex(of: numbOfQns)!, inComponent: 0, animated: true)
//        setNumberOfQuestionsLabel.textAlignment = .center
        questionNumberTextField.inputView = questionPickerView
        
        timeTextField.inputView = questionPickerView
        
        questionNumberTextField.textAlignment = .center
        questionNumberTextField.contentVerticalAlignment = .center
        
        instructionsbutton.layer.cornerRadius = 10
        startQuizButton.layer.cornerRadius = 10
        playVideoAccordingly(viewName: videoBackgroundView)
        instructionsbutton.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
        
        loadStuff(item: .initial)
        
        questionNumberTextField.attributedText = NSMutableAttributedString()
                .bold("Number of Questions: ")
                .normal("\(String(numbOfQns))")
        timeTextField.attributedText = timeForQn > 1 ? NSMutableAttributedString().bold("Time for Each Question: ").normal("\(String(timeForQn)) seconds") : NSMutableAttributedString().bold("Time for Each Question: ").normal("\(String(timeForQn)) second")
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.label]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.tintColor = .label
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self,  selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self,  selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }

deinit {
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
}
@objc func keyboardWillChange(notification: Notification) {
    guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
        return
    }
    if notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification {
        view.frame.origin.y = -keyboardRect.height+20
    } else if notification.name == UIResponder.keyboardWillHideNotification {
        view.frame.origin.y = 0
    }
}
override func viewWillDisappear(_ animated: Bool) {
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: self.view.window)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: self.view.window)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: self.view.window)
    NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
}
    enum QuizItems {
        case initial
        case quizNumberOfQns
        case quizTime
    }
    func loadStuff(item: QuizItems) {
        switch item {
        case .initial:
            if defaults.object(forKey: "QuizNumberOfQns") != nil {
                numbOfQns = defaults.integer(forKey: "QuizNumberOfQns")
            } else {
                defaults.setValue(numbOfQns, forKey: "QuizNumberOfQns")
            }
            
            if defaults.object(forKey: "QuizTime") != nil {
                timeForQn = defaults.integer(forKey: "QuizTime")
            } else {
                defaults.setValue(timeForQn, forKey: "QuizTime")
            }
        case .quizNumberOfQns:
            print("Number of questions is", numbOfQns)
            defaults.setValue(numbOfQns, forKey: "QuizNumberOfQns")
        case .quizTime:
            print("Time for each question is", timeForQn)
            defaults.setValue(timeForQn, forKey: "QuizTime")
        }
    }
    @IBAction func startOverQuiz (segue: UIStoryboardSegue){
        
    }
    
    func playVideoAccordingly(viewName: UIView) {
        viewName.layer.sublayers?.removeAll()
        viewName.layer.sublayers = nil
        var indexNumber: Int?
        if self.title == "Haze Quiz" {
            indexNumber = 1
        } else if self.title == "Virus Quiz" {
            indexNumber = 0
        } else {
            videoBackgroundView.isHidden = true
            view.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        }
        
        if indexNumber != nil {
            if traitCollection.userInterfaceStyle == UIUserInterfaceStyle.light {
                playVideo(forView: viewName, withName: videos_light[indexNumber!].name, ofFileType: videos_light[indexNumber!].fileType)
            } else if traitCollection.userInterfaceStyle == UIUserInterfaceStyle.dark {
                playVideo(forView: viewName, withName: videos_dark[indexNumber!].name, ofFileType: videos_dark[indexNumber!].fileType)
            }
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        playVideoAccordingly(viewName: videoBackgroundView)
    }
    
    func playVideo(forView viewName: UIView, withName videoName: String, ofFileType fileType: String) {
        guard let path = Bundle.main.path(forResource: videoName, ofType: fileType) else {return}
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = viewName.bounds
        playerLayer.videoGravity = .resizeAspect
        viewName.layer.addSublayer(playerLayer)
        loopVideo(videoPlayer: player)
        player.play()
    }
    
    func loopVideo(videoPlayer: AVPlayer) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil, queue: nil) { notification in
            videoPlayer.seek(to: CMTime.zero)
            videoPlayer.play()
        }
    }

    
    @IBAction func startQuiz(_ sender: Any) {
        performSegue(withIdentifier: "playQuiz", sender: nil)
    }
    @IBAction func close(_ sender: Any) {
        DispatchQueue.global(qos: .background).async {

        // Background Thread

        DispatchQueue.main.async {
            self.navigationController?.navigationBar.isHidden = true
            }
        }
        performSegue(withIdentifier: "closeQuizMain", sender: nil)
    }
    
    
    @IBAction func seeInstructions(_ sender: Any) {
        let alert = UIAlertController(title: "Instructions for Quiz", message: "A certain number of seconds will be given for each of the questions, based on the user's choice.\nFor each question, once the timer has ended, the correct answer will be shown, even if question has yet to be answered.\nA correct answer will result in an increment in 1 point to the total score\nAn incorrect answer or unattempted answer will not result in a change in the total score\nThe number of questions can vary from 2-10 questions, based on the user's choice\nOnce the game has ended, the user will have options to go back to homepage or play quiz/start over again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true) {
            alert.view.superview?.isUserInteractionEnabled = true
            alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertControllerBackgroundTapped)))
        }
    }
    
    @objc func alertControllerBackgroundTapped()
    {
        self.dismiss(animated: true, completion: nil)
    }
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "playQuiz" {
            let destVC = segue.destination as! QuizThingViewController
            var listOfQuestions = [QuizQuestion]()
            if self.title == "Haze Quiz" {
                listOfQuestions = HazeQuestions
            } else if self.title == "Virus Quiz" {
                listOfQuestions = VirusQuestions
            } else if self.title == "Viraze Quiz" {
                listOfQuestions = VirusQuestions+HazeQuestions
            }
            for _ in 0..<numbOfQns {
                let thing = listOfQuestions.randomElement()!
                listOfQuestions.remove(at: listOfQuestions.firstIndex(of: thing)!)
                destVC.quizzes.append(thing)
            }
            destVC.timeAllowed = timeForQn
            destVC.title = title
        }
    }
}

extension NSMutableAttributedString {
    var fontSize:CGFloat { return 14 }
    var boldFont:UIFont { return UIFont(name: "Futura Bold", size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize) }
    var normalFont:UIFont { return UIFont(name: "Futura Medium", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)}

    func bold(_ value:String) -> NSMutableAttributedString {

        let attributes:[NSAttributedString.Key : Any] = [
            .font : boldFont
        ]

        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }

    func normal(_ value:String) -> NSMutableAttributedString {

        let attributes:[NSAttributedString.Key : Any] = [
            .font : normalFont,
        ]

        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    /* Other styling methods */
    func orangeHighlight(_ value:String) -> NSMutableAttributedString {

        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .foregroundColor : UIColor.white,
            .backgroundColor : UIColor.orange
        ]

        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }

    func blackHighlight(_ value:String) -> NSMutableAttributedString {

        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .foregroundColor : UIColor.white,
            .backgroundColor : UIColor.black

        ]

        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }

    func underlined(_ value:String) -> NSMutableAttributedString {

        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .underlineStyle : NSUnderlineStyle.single.rawValue

        ]

        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
}
