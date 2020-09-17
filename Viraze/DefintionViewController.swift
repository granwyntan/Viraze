//
//  DefinitionViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 23/8/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit
import SafariServices
import WebKit
import AVFoundation

class DefintionViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var leftArrow: UIButton!
    @IBOutlet weak var rightArrow: UIButton!
    @IBOutlet var swipeLeftOnImage: UISwipeGestureRecognizer!
    @IBOutlet var swipeRightOnImage: UISwipeGestureRecognizer!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var browser: WKWebView!
    @IBOutlet weak var videoPlayerView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imagePageControl: UIPageControl!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var sourceButton: UIButton!
    var currentPhoto = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newcancelButton = UIButton(frame: CGRect(x: view.bounds.width-40, y: 40, width: 30, height: 30))
        newcancelButton.isUserInteractionEnabled = true
        newcancelButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        newcancelButton.addTarget(self, action: #selector(closeCard), for: .touchUpInside)
        newcancelButton.autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin]
        newcancelButton.scalesLargeContentImage = true
        
        //conceptNameLabel.numberOfLines = 3; // Dynamic number of lines
        //
        //conceptNameLabel.lineBreakMode = NSLineBreakMode.byWordWrapping;
        //
        //conceptNameLabel.text = conceptName
        
//        let myURL = URL(string:
//            "")
//        let myRequest = URLRequest(url: myURL!)
//        browser.load(myRequest)
//        label.text = 
//        text.text =
        // Do any additional setup after loading the view.
//        assignbackground()
        
//        self.transitioningDelegate = self
//        modalPresentationStyle = .custom
//        let attributedString = NSMutableAttributedString(string: String)
//        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 8), range: NSRange(location: 0, length: 4))
//        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSRange(location: 5, length: 2))
//        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 24), range: NSRange(location: 8, length: 1))
//        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 32), range: NSRange(location: 10, length: 4))
//        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 40), range: NSRange(location: 15, length: 6))
        if Haze[selectedHazeCard!-1].sources.count == 1 {
            sourceButton.setTitle("Source", for: .normal)
        }
        rightArrow.isHidden = true
        leftArrow.isHidden = true
        
        swipeLeftOnImage.isEnabled = false
        swipeRightOnImage.isEnabled = false
        browser.isHidden = true
        videoPlayerView.isHidden = true
        image.isHidden = true
        imagePageControl.isHidden = true
        background.image = UIImage(named: Haze[selectedHazeCard!-1].backgroundImageName)
        label.text = Haze[selectedHazeCard!-1].title
        text.text = Haze[selectedHazeCard!-1].content
        if let videoLinkName = Haze[selectedHazeCard!-1].videoLink {
            browser.isHidden = false
            browser.load(URLRequest(url: URL(string: videoLinkName)!))
        }
        
        if label.text == "Causes" {
            newcancelButton.tintColor = .black
        } else {
            newcancelButton.tintColor = .white
        }
        self.view.addSubview(newcancelButton)
        
        if let imagesNames = Haze[selectedHazeCard!-1].imageNames {
            image.isUserInteractionEnabled = true
            if imagesNames.count > 1 {
                imagePageControl.numberOfPages = imagesNames.count
                imagePageControl.isHidden = false
                rightArrow.isHidden = false
                leftArrow.isHidden = false
                swipeLeftOnImage.isEnabled = true
                swipeRightOnImage.isEnabled = true
            }
            image.isHidden = false
            updatePhotoAndPageControl()
        }
        
        if let videoPlayerFileName = Haze[selectedHazeCard!-1].animationName {
            if let videoPlayerFileType = Haze[selectedHazeCard!-1].animationFileType {
                videoPlayerView.isHidden = false
                playVideo(forView: videoPlayerView, withName: videoPlayerFileName, ofFileType: videoPlayerFileType)
            }
        }
        
        if label.text == "Causes" {
            label.textColor = .black
            text.textColor = .black
        }
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
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
//        let imageView = sender.view as! UIImageView
//        let newImageView = UIImageView(image: imageView.image)
//        newImageView.frame = UIScreen.main.bounds
//        newImageView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.85)
//        newImageView.contentMode = .scaleAspectFit
//        newImageView.isUserInteractionEnabled = true
//        newImageView.enableZoom()
//        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
//        newImageView.addGestureRecognizer(tap)
//        self.view.addSubview(newImageView)
//        self.navigationController?.isNavigationBarHidden = true
//        self.tabBarController?.tabBar.isHidden = true
        
//        let window = UIApplication.shared.keyWindow!
        let viewHeight: CGFloat = self.view.bounds.size.height
            //- window.safeAreaInsets.top
        let viewWidth: CGFloat = self.view.bounds.size.width
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0 //window.safeAreaInsets.top
            , width: viewWidth, height: viewHeight))
        scrollView.isPagingEnabled = true
//        scrollView.canCancelContentTouches = false
        
        let images = Haze[selectedHazeCard!-1].imageNames!
        var xPostion: CGFloat = 0
        
        for image in images {
            let myView = UIView(frame: CGRect(x: xPostion, y: 0, width: viewWidth, height: viewHeight))
            xPostion += viewWidth
            let imageView = ImageViewZoom(frame: CGRect(x: 0, y: 0, width: myView.frame.size.width, height: myView.frame.size.height))
            
            imageView.setup()
            imageView.imageScrollViewDelegate = self
            imageView.imageContentMode = .aspectFit
            imageView.initialOffset = .center
            imageView.display(image: UIImage(named: image)!)
            imageView.isUserInteractionEnabled = true
            
            myView.addSubview(imageView)
            scrollView.addSubview(myView)
            
//            scrollView.touchesShouldCancel(in: myView)
//            scrollView.touchesShouldCancel(in: imageView)
//            if scrollView.zoomScale > 1 {
//                let ratioW = imageView.frame.width / imageView.imageSize.width
//                let ratioH = imageView.frame.height / imageView.imageSize.height
//
//                let ratio = ratioW < ratioH ? ratioW : ratioH
//                let newWidth = imageView.imageSize.width * ratio
//                let newHeight = imageView.imageSize.height * ratio
//                let conditionLeft = newWidth*scrollView.zoomScale > imageView.frame.width
//                let left = 0.5 * (conditionLeft ? newWidth - imageView.frame.width : (scrollView.frame.width - scrollView.contentSize.width))
//                let conditionTop = newHeight*scrollView.zoomScale > imageView.frame.height
//
//                let top = 0.5 * (conditionTop ? newHeight - imageView.frame.height : (scrollView.frame.height - scrollView.contentSize.height))
//
//                scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
//            } else {
//                scrollView.contentInset = .zero
//            }
            
            scrollView.touchesShouldCancel(in: myView)
            scrollView.touchesShouldCancel(in: imageView)
        }
//        print("Zoom Scale is \(scrollView.zoomScale)")
//        scrollView.isUserInteractionEnabled = true
//        self.view.bringSubviewToFront(cancelButton)
        let cancelButton = UIButton(frame: CGRect(x: viewWidth-40, y: 40
            //+window.safeAreaInsets.top
            , width: 30, height: 30))
        cancelButton.isUserInteractionEnabled = true
        cancelButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        cancelButton.tintColor = .white
        cancelButton.addTarget(self, action: #selector(dismissPage(_:)), for: .touchUpInside)
        cancelButton.autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin]
        var viewNumber = 0
        let newImageView = sender.view as! UIImageView
//        let newImageView = UIImageView(image: imageView.image)
        for x in images {
            if UIImage(named: x) == newImageView.image {
                scrollView.contentOffset = CGPoint(x: viewNumber*Int(viewWidth), y: 0)
            }
            viewNumber += 1
        }
        
        scrollView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.85)
        let longTap = UILongPressGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        scrollView.addGestureRecognizer(longTap)
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        swipeUp.direction = .up
        scrollView.addGestureRecognizer(swipeUp)
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        swipeDown.direction = .down
        scrollView.addGestureRecognizer(swipeDown)
//        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
//        scrollView.addGestureRecognizer(tap)
        scrollView.canCancelContentTouches = true
        scrollView.delaysContentTouches = false
        scrollView.contentSize = CGSize(width: xPostion, height: viewHeight)
        self.view.addSubview(scrollView)
        self.view.addSubview(cancelButton)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
        scrollView.tag = 100
        cancelButton.tag = 200
        
    }

    @objc func dismissPage (_ sender: UIButton) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
//        print(view.subviews)
//        for x in self.view.subviews {
//            print(x)
//        }
        view.viewWithTag(100)?.removeFromSuperview()
        view.viewWithTag(200)?.removeFromSuperview()
//        sender.removeFromSuperview()
//        print()
//        print(view.subviews)
    }
    @objc func dismissFullscreenImage(_ sender: UIGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
//        sender.view?.removeFromSuperview()
        view.viewWithTag(100)?.removeFromSuperview()
        view.viewWithTag(200)?.removeFromSuperview()
    }
    
    @IBAction func swipeRightThing(_ sender: Any) {
        if currentPhoto > 0 {
            currentPhoto -= 1
        }
//        else {
//            currentPhoto = Haze[selectedHazeCard!-1].imageNames!.count-1
//        }
        updatePhotoAndPageControl()
    }
    @IBAction func swipeLeftThing(_ sender: Any) {
        if currentPhoto < Haze[selectedHazeCard!-1].imageNames!.count-1 {
            currentPhoto += 1
        }
//        else {
//            currentPhoto = 0
//        }
        updatePhotoAndPageControl()
    }
    
    @IBAction func valueChangedPageControl(_ sender: Any) {
        currentPhoto = imagePageControl.currentPage
        updatePhotoAndPageControl()
    }
    
    func updatePhotoAndPageControl() {
        image.image = UIImage(named: Haze[selectedHazeCard!-1].imageNames![currentPhoto])
        imagePageControl.currentPage = currentPhoto
        if currentPhoto == 0 {
            leftArrow.isHidden = true
            rightArrow.isHidden = false
        } else if currentPhoto == Haze[selectedHazeCard!-1].imageNames!.count-1 {
            leftArrow.isHidden = false
            rightArrow.isHidden = true
        } else {
            leftArrow.isHidden = false
            rightArrow.isHidden = false
        }
    }
    
//    func loopVideo(videoPlayer: AVPlayer) {
//        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil, queue: nil) { notification in
//            videoPlayer.seek(to: CMTime.zero)
//            videoPlayer.play()
//        }
//    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
//    }

//    func assignbackground(){
//        let background = backgroundName
//        var imageView: UIImageView!
//        imageView = UIImageView(frame: view.bounds)
//        imageView.contentMode =  .scaleAspectFill
//        imageView.clipsToBounds = true
//        imageView.image = background
//        imageView.center = view.center
//        view.addSubview(imageView)
//        self.view.sendSubviewToBack(imageView)
//    }

    //    @IBAction func dismiss(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//    }
//    @IBAction func sourceClick(_ sender: UIButton) {
//        if sender == nlbButton {
//            present(SFSafariViewController(url: URL(string: "https://eresources.nlb.gov.sg/infopedia/articles/SIP_2013-08-30_185150.html#:~:text=The%20haze%20usually%20occurs%20during,of%20the%20haze%20in%20Singapore")!), animated: true)
//        } else if sender == wikiButton {
//            present(SFSafariViewController(url: URL(string: "https://en.wikipedia.org/wiki/Haze")!), animated: true)
//        }
//    }
    
    @objc func closeCard() {
        performSegue(withIdentifier: "closeCard", sender: nil)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "seeSources" {
            let navVC = segue.destination as? UINavigationController
            let destVC = navVC?.viewControllers.first as! SourcesTableViewController
            destVC.sourcesData = Haze[selectedHazeCard!-1].sourcesName
            destVC.sourcesLinks = Haze[selectedHazeCard!-1].sources
        }
    }
    
    @IBAction func tapToSeeSources(_ sender: Any) {
        if Haze[selectedHazeCard!-1].sources.count == 1 {
            present(SFSafariViewController(url: URL(string: Haze[selectedHazeCard!-1].sources[0])!), animated: true)
        } else {
            performSegue(withIdentifier: "seeSources", sender: nil)
        }
    }
    
}

extension UIImageView {
  func enableZoom() {
    let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(startZooming(_:)))
    isUserInteractionEnabled = true
    addGestureRecognizer(pinchGesture)
  }

  @objc
  private func startZooming(_ sender: UIPinchGestureRecognizer) {
    let scaleResult = sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)
    guard let scale = scaleResult, scale.a > 1, scale.d > 1 else { return }
    sender.view?.transform = scale
    sender.scale = 1
  }
}

extension DefintionViewController: ImageViewZoomDelegate {
    func imageScrollViewDidChangeOrientation(imageViewZoom: ImageViewZoom) {
        print("Did change orientation")
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        print("scrollViewDidEndZooming at scale \(scale)")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollViewDidScroll at offset \(scrollView.contentOffset)")
    }
}

