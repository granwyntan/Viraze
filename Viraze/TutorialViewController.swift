//
//  TutorialViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 13/8/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit
import AVFoundation

class TutorialViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    var seguePerformed = false
//    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var pagecontrol: UIPageControl!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var instructions: UILabel!
    @IBOutlet var longPress: UILongPressGestureRecognizer!
    @IBOutlet weak var playingThing: UIView!

    var currentPage = 0
    
    func playVideo(withName name: String, ofFileType fileType: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: fileType) else {return}
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.playingThing.bounds
        playerLayer.videoGravity = .resizeAspect
        playingThing.layer.addSublayer(playerLayer)
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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        defaults.setValue("TutorialViewController", forKey: "LaunchViewController")
        self.navigationItem.hidesBackButton = true
        pagecontrol.numberOfPages = tutorials.count
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(nextTutorial))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(prevTutorial))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(nextTutorial))
        self.view.addGestureRecognizer(tap)
        
        if let theCurrentPage = defaults.string(forKey: "TutorialPage") {
            currentPage = Int(theCurrentPage)!
            pagecontrol.currentPage = currentPage
//            image.image = UIImage(named: tutorials[currentPage].image)
            startPlayingVideo()
            if currentPage == 2 {
                instructions.text = "Long Press Anywhere to Continue"
                longPress.isEnabled = true
            } else {
                instructions.text = "Tap or Swipe to Navigate"
                longPress.isEnabled = false
            }
        } else {
            startPlayingVideo()
            pagecontrol.numberOfPages = tutorials.count
        }
    }
    @IBAction func pageControlChange(_ sender: UIPageControl) {
        currentPage = pagecontrol.currentPage
//        image.image = UIImage(named: tutorials[currentPage].image)
        startPlayingVideo()
        if currentPage == 2 {
            instructions.text = "Long Press Anywhere to Continue"
            longPress.isEnabled = true
        } else {
            instructions.text = "Tap or Swipe to Navigate"
            longPress.isEnabled = false
        }
        defaults.setValue(sender.currentPage, forKey: "TutorialPage")
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if traitCollection.userInterfaceStyle == UIUserInterfaceStyle.light {
            playVideo(withName: tutorials[currentPage].videoName, ofFileType: tutorials[currentPage].videoFileType)
            titleLabel.text = tutorials[currentPage].title
            descriptionLabel.text = tutorials[currentPage].desc
        } else if traitCollection.userInterfaceStyle == UIUserInterfaceStyle.dark {
            playVideo(withName: tutorialsDark[currentPage].videoName, ofFileType: tutorialsDark[currentPage].videoFileType)
            titleLabel.text = tutorialsDark[currentPage].title
            descriptionLabel.text = tutorialsDark[currentPage].desc
        }
    }
    
    func startPlayingVideo () {
        if traitCollection.userInterfaceStyle == UIUserInterfaceStyle.light {
            playVideo(withName: tutorials[currentPage].videoName, ofFileType: tutorials[currentPage].videoFileType)
            titleLabel.text = tutorials[currentPage].title
            descriptionLabel.text = tutorials[currentPage].desc
        } else if traitCollection.userInterfaceStyle == UIUserInterfaceStyle.dark {
            playVideo(withName: tutorialsDark[currentPage].videoName, ofFileType: tutorialsDark[currentPage].videoFileType)
            titleLabel.text = tutorialsDark[currentPage].title
            descriptionLabel.text = tutorialsDark[currentPage].desc
        }
    }
    
    @objc func prevTutorial(){
        if currentPage > 0 {
            instructions.text = "Tap or Swipe to Navigate"
            currentPage -= 1
//            image.image = UIImage(named: tutorials[currentPage].image)
            startPlayingVideo()
            pagecontrol.currentPage = currentPage
            longPress.isEnabled = false
        }
        defaults.setValue(currentPage, forKey: "TutorialPage")
    }
    @objc func nextTutorial() {
        if currentPage < tutorials.count-1 {
            instructions.text = "Tap or Swipe to Navigate"
            currentPage += 1
//            image.image = UIImage(named: tutorials[currentPage].image)
            startPlayingVideo()
            pagecontrol.currentPage = currentPage
            longPress.isEnabled = false
        }
        if currentPage == 2 {
            instructions.text = "Long Press Anywhere to Continue"
            longPress.isEnabled = true
        }
        defaults.setValue(currentPage, forKey: "TutorialPage")
    }
    
    @IBAction func longPress(_ sender: Any) {
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
