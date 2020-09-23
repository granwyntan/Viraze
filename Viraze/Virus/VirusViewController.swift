//
//  VirusViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 15/9/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit
import WebKit

class VirusViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var webview: WKWebView!
    @IBOutlet weak var text: UITextView!
    var selectedRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let newcancelButton = UIButton(frame: CGRect(x: view.bounds.width-40, y: 40, width: 30, height: 30))
//        newcancelButton.isUserInteractionEnabled = true
//        newcancelButton.setImage(UIImage(systemName: "xmark"), for: .normal)
//        //newcancelButton.addTarget(self, action: #selector(closeCard), for: .touchUpInside)
//        newcancelButton.autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin]
//        newcancelButton.scalesLargeContentImage = true
//
        self.title = Virus[selectedVirusCard!-1].data[selectedRow!].header
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
//        self.navigationController?.navigationBar.largeTitleTextAttributes = [
//            NSAttributedString.Key.foregroundColor: UIColor.label,
//            NSAttributedString.Key.font : UIFont.preferredFont(forTextStyle: .largeTitle)
//                                        ]
        for navItem in(self.navigationController?.navigationBar.subviews)! {
             for itemSubView in navItem.subviews {
                 if let largeLabel = itemSubView as? UILabel {
                     largeLabel.text = self.title
                     largeLabel.numberOfLines = 0
                     largeLabel.lineBreakMode = .byWordWrapping
                 }
             }

        }
        image.isUserInteractionEnabled = true
        webview.isHidden = true
        image.isHidden = true
        text.text = Virus[selectedVirusCard!-1].data[selectedRow!].headerContents.description
        if let videoLinkName = Virus[selectedVirusCard!-1].data[selectedRow!].headerContents.videoLink {
            webview.isHidden = false
            webview.load(URLRequest(url: URL(string: videoLinkName)!))
        }
        if let imageName = Virus[selectedVirusCard!-1].data[selectedRow!].headerContents.imageName {
            image.isHidden = false
            image.image = UIImage(named: imageName)
            if imageName.contains("coronavirus") {
                image.contentMode = .scaleAspectFill
            } else {
                image.contentMode = .scaleAspectFit
            }
        }
        
//        self.view.addSubview(newcancelButton)
        
        /*if let imagesNames = Haze[selectedHazeCard!-1].imageName {
            image.isUserInteractionEnabled = true
            image.isHidden = false
            image.image = UIImage(named: Haze[selectedVirusCard!-1].imageName)
        }*/
        image.isUserInteractionEnabled = true
    }
    private lazy var setupLargeTitleLabelOnce: Void = {[unowned self] in
        if #available(iOS 11.0, *) {
            self.setupLargeTitleAutoAdjustFont()
        }
    }()

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let _ = setupLargeTitleLabelOnce
    }
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
        cancelButton.tag = 300
        newImageView.tag = 400
        newImageView.enableZoom()
    }
    
    @objc func dismissPage (_ sender: UIButton) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
//        print(view.subviews)
//        for x in self.view.subviews {
//            print(x)
//        }
        view.viewWithTag(300)?.removeFromSuperview()
        view.viewWithTag(400)?.removeFromSuperview()
//        sender.removeFromSuperview()
//        print()
//        print(view.subviews)
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        view.viewWithTag(300)?.removeFromSuperview()
        view.viewWithTag(400)?.removeFromSuperview()
        self.tabBarController?.tabBar.isHidden = false
        //sender.view?.removeFromSuperview()
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
