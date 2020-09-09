//
//  MoreDetailsViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 9/9/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit
import WebKit
import AVFoundation

class MoreDetailsViewController: UIViewController {

    var titleName: String?
    var content: String?
    var videoLink: String?
    var imageName: [String]?
    var animationName: String?
    var animationFileType: String?
    var backgroundImageName: String?

    @IBOutlet weak var browser: WKWebView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var contentText: UITextView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var animationPlayerView: UIView!
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if let imageName = imageName {
            if imageName[0] == "Viraze (Haze Timeline)" {
                if traitCollection.userInterfaceStyle == UIUserInterfaceStyle.light {
                    image.image = UIImage(named: imageName[0])
                } else if traitCollection.userInterfaceStyle == UIUserInterfaceStyle.dark {
                    image.image = UIImage(named: "\(imageName[0])-dark")
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = titleName
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic

//        self.navigationController?.navigationBar.largeTitleTextAttributes = [
//            NSAttributedString.Key.foregroundColor: UIColor.black,
//            NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .largeTitle)]

//        self.navigationItem.hidesBackButton = true
//        for navItem in(self.navigationController?.navigationBar.subviews)! {
//             for itemSubView in navItem.subviews {
//                 if let largeLabel = itemSubView as? UILabel {
//                     largeLabel.text = self.title
//                     largeLabel.numberOfLines = 0
//                     largeLabel.lineBreakMode = .byWordWrapping
//                 }
//             }
//        }
        
        contentText.text = content
        
        browser.isHidden = true
        image.isHidden = true
        animationPlayerView.isHidden = true
        if let videoLinkName = videoLink {
            browser.isHidden = false
            browser.load(URLRequest(url: URL(string: videoLinkName)!))
        }
        
        if let backgroundImageName = backgroundImageName {
            backgroundImage.image = UIImage(named: backgroundImageName)
        }
        
        if let imageName = imageName {
            if imageName[0] == "Viraze (Haze Timeline)" {
                if traitCollection.userInterfaceStyle == UIUserInterfaceStyle.light {
                    image.image = UIImage(named: imageName[0])
                } else if traitCollection.userInterfaceStyle == UIUserInterfaceStyle.dark {
                    image.image = UIImage(named: "\(imageName[0])-dark")
                }
            }
            image.isHidden = false
        }
        
        if let videoPlayerFileName = animationName {
            if let videoPlayerFileType = animationFileType {
                animationPlayerView.isHidden = false
                playVideo(forView: animationPlayerView, withName: videoPlayerFileName, ofFileType: videoPlayerFileType)
            }
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func playVideo(forView viewName: UIView, withName videoName: String, ofFileType fileType: String) {
            guard let path = Bundle.main.path(forResource: videoName, ofType: fileType) else {return}
            let player = AVPlayer(url: URL(fileURLWithPath: path))
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = viewName.bounds
            playerLayer.videoGravity = .resizeAspect
            viewName.layer.addSublayer(playerLayer)
            player.play()
    //        loopVideo(videoPlayer: player)
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
