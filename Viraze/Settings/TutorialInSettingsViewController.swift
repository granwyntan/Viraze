//
//  TutorialInSettingsViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 5/9/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit
import AVFoundation

class TutorialInSettingsViewController: UIViewController {
    
    var seguePerformed = false
    @IBOutlet weak var ViewThing: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var instructions: UILabel!
    @IBOutlet var longPressGesture: UILongPressGestureRecognizer!
    
    var currentPage = 0
    
    func playVideo(withName name: String, ofFileType fileType: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: fileType) else {return}
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.ViewThing.bounds
        playerLayer.videoGravity = .resizeAspect
        ViewThing.layer.addSublayer(playerLayer)
        loopVideo(videoPlayer: player)
        player.play()
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
        startPlayingVideo()
        pageControl.numberOfPages = tutorials.count
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(nextTutorial))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(prevTutorial))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(nextTutorial))
        self.view.addGestureRecognizer(tap)
        ViewThing.layer.cornerRadius = 10
        ViewThing.layer.masksToBounds = true

    }
    @IBAction func pageControlChange(_ sender: UIPageControl) {
        currentPage = pageControl.currentPage
//        image.image = UIImage(named: tutorials[currentPage].image)
        startPlayingVideo()
        if currentPage == 2 {
            instructions.text = "Long Press Anywhere to Continue"
            longPressGesture.isEnabled = true
        } else {
            instructions.text = "Tap or Swipe to Navigate"
            longPressGesture.isEnabled = false
        }
    }
    @objc func prevTutorial(){
        if currentPage > 0 {
            instructions.text = "Tap or Swipe to Navigate"
            currentPage -= 1
//            image.image = UIImage(named: tutorials[currentPage].image)
            startPlayingVideo()
            pageControl.currentPage = currentPage
            longPressGesture.isEnabled = false
        }
    }
    @objc func nextTutorial() {
        if currentPage < tutorials.count-1 {
            instructions.text = "Tap or Swipe to Navigate"
            currentPage += 1
//            image.image = UIImage(named: tutorials[currentPage].image)
            startPlayingVideo()
            pageControl.currentPage = currentPage
            longPressGesture.isEnabled = false
        }
        if currentPage == 2 {
            instructions.text = "Long Press Anywhere to Continue"
            longPressGesture.isEnabled = true
        }
    }
    func startPlayingVideo () {
        ViewThing.layer.sublayers?.removeAll()
        ViewThing.layer.sublayers = nil
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
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        startPlayingVideo()
    }
    @IBAction func longPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
