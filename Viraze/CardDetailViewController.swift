//
//  CardDetailViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 23/8/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit
import SafariServices

class CardDetailViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var hazeDefinitionText: UITextView!
    //    var backgroundName = UIImage()
    @IBOutlet weak var nlbButton: UIButton!
    @IBOutlet weak var wikiButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

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
    }

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
    @IBAction func sourceClick(_ sender: UIButton) {
        if sender == nlbButton {
            present(SFSafariViewController(url: URL(string: "https://eresources.nlb.gov.sg/infopedia/articles/SIP_2013-08-30_185150.html#:~:text=The%20haze%20usually%20occurs%20during,of%20the%20haze%20in%20Singapore")!), animated: true)
        } else if sender == wikiButton {
            present(SFSafariViewController(url: URL(string: "https://en.wikipedia.org/wiki/Haze")!), animated: true)
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
