//
//  McqMainViewController.swift
//  MCQTemplate
//
//  Created by Granwyn Tan on 20/9/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit
import AVFoundation

class McqMainViewController: UIViewController {
    
    struct video {
        var name: String
        var fileType: String
    }
    let videos_light = [
        video(name: "Virus (Light)", fileType: "mov"),
        video(name: "Haze (Light)", fileType: "mov")
    ]
    
    let videos_dark = [
        video(name: "Virus (Dark)", fileType: "mov"),
        video(name: "Haze (Dark)", fileType: "mov")
    ]
    
    
    @IBOutlet weak var videoBackgroundView: UIView!
    @IBOutlet weak var instructionsbutton: UIButton!
    @IBOutlet weak var startQuizButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        instructionsbutton.layer.cornerRadius = 10
        startQuizButton.layer.cornerRadius = 10
        playVideoAccordingly(viewName: videoBackgroundView)
        instructionsbutton.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
        
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
        player.play()
        loopVideo(videoPlayer: player)
    }
    
    func loopVideo(videoPlayer: AVPlayer) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil, queue: nil) { notification in
            videoPlayer.seek(to: CMTime.zero)
            videoPlayer.play()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }

    
    @IBAction func startQuiz(_ sender: Any) {
        performSegue(withIdentifier: "playQuiz", sender: nil)
    }
    
    @IBAction func seeInstructions(_ sender: Any) {
        let alert = UIAlertController(title: "Instructions for Quiz", message: "20 seconds will be given for each of the questions\nOnce the timer has ended, the correct answer will be shown, even if question has yet to be answered\nA correct answer will result in an increment in 1 point to the total score\nAn incorrect answer or unattempted answer will not result in a change in the total score\nThere are a total of 5 questions for each quiz\nOnce the game has ended, the user will have options to go back to homepage or play quiz again\nScores will be saved in a leaderboard after the game has ended", preferredStyle: .alert)
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
            for _ in 0..<5 {
                let thing = listOfQuestions.randomElement()!
                listOfQuestions.remove(at: listOfQuestions.firstIndex(of: thing)!)
                destVC.quizzes.append(thing)
            }
        }
    }
}
