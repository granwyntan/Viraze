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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
