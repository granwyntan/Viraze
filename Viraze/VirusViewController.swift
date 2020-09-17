//
//  VirusViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 15/9/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

class VirusViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var webview: WKWebView!
    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var titlething: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let newcancelButton = UIButton(frame: CGRect(x: view.bounds.width-40, y: 40, width: 30, height: 30))
        newcancelButton.isUserInteractionEnabled = true
        newcancelButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        //newcancelButton.addTarget(self, action: #selector(closeCard), for: .touchUpInside)
        newcancelButton.autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin]
        newcancelButton.scalesLargeContentImage = true
        
        webview.isHidden = true
        image.isHidden = true
        text.text = Haze[selectedHazeCard!-1].title
        text.text = Haze[selectedHazeCard!-1].content
        if let videoLinkName = Haze[selectedHazeCard!-1].videoLink {
            webview.isHidden = false
            webview.load(URLRequest(url: URL(string: videoLinkName)!))
        }
        
        
        self.view.addSubview(newcancelButton)
        
        /*if let imagesNames = Haze[selectedHazeCard!-1].imageName {
            image.isUserInteractionEnabled = true
            image.isHidden = false
            image.image = UIImage(named: Haze[selectedVirusCard!-1].imageName)
        }*/
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
