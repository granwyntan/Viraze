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
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupLargeTitleAutoAdjustFont()
    }
    
    private lazy var setupLargeTitleLabelOnce: Void = {[unowned self] in
        if #available(iOS 11.0, *) {
            self.setupLargeTitleAutoAdjustFont()
        }
    }()
    
    func setupLargeTitleAutoAdjustFont() {
        guard let navigationBar = navigationController?.navigationBar else {
            return
        }
        // recursively find the label
        func findLabel(in view: UIView) -> UILabel? {
            if view.subviews.count > 0 {
                for subview in view.subviews {
                    if let label = findLabel(in: subview) {
                        return label
                    }
                }
            }
            return view as? UILabel
        }

        if let label = findLabel(in: navigationBar) {
            if label.text == self.title {
                label.adjustsFontSizeToFitWidth = true
                // label.minimumScaleFactor = 0.7
            }
            //label.numberOfLines = 2
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let _ = setupLargeTitleLabelOnce
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = titleName
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
//        self.navigationController?.navigationBar.largeTitleTextAttributes = [
//            NSAttributedString.Key.foregroundColor: UIColor.black,
//            NSAttributedString.Key.font : UIFont.preferredFont(forTextStyle: .largeTitle)
//                                        ]
//        for navItem in(self.navigationController?.navigationBar.subviews)! {
//             for itemSubView in navItem.subviews {
//                 if let largeLabel = itemSubView as? UILabel {
//                     largeLabel.text = self.title
//                     largeLabel.numberOfLines = 0
//                     largeLabel.lineBreakMode = .byWordWrapping
//                 }
//             }
//
//        }
//        setupLargeTitleAutoAdjustFont()
        
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
            image.image = UIImage(named: imageName[0])
            image.contentMode = .scaleAspectFit
            if imageName[0].contains("hazeimage") || imageName[0].contains("hazecontentimage") || imageName[0] == "hazeMasks" {
                image.contentMode = .scaleAspectFill
            }
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
    
    @IBAction func tapImage(_ sender: UITapGestureRecognizer) {
        let viewHeight: CGFloat = self.view.bounds.size.height
            //- window.safeAreaInsets.top
        let viewWidth: CGFloat = self.view.bounds.size.width
        let cancelButton = UIButton(frame: CGRect(x: viewWidth-40, y: 40
            //+window.safeAreaInsets.top
            , width: 30, height: 30))
        cancelButton.isUserInteractionEnabled = true
        cancelButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        cancelButton.tintColor = .white
        cancelButton.addTarget(self, action: #selector(dismissPage(_:)), for: .touchUpInside)
        cancelButton.autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin]
        let imageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.85)
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.view.addSubview(cancelButton)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
        cancelButton.tag = 500
        newImageView.tag = 600
        newImageView.enableZoom()
    }
    
    @objc func dismissPage (_ sender: UIButton) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
//        print(view.subviews)
//        for x in self.view.subviews {
//            print(x)
//        }
        view.viewWithTag(500)?.removeFromSuperview()
        view.viewWithTag(600)?.removeFromSuperview()
//        sender.removeFromSuperview()
//        print()
//        print(view.subviews)
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        view.viewWithTag(500)?.removeFromSuperview()
        view.viewWithTag(600)?.removeFromSuperview()
        self.tabBarController?.tabBar.isHidden = false
        //sender.view?.removeFromSuperview()
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
