//
//  ShowMasksViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 19/9/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit

class ShowMasksViewController: UIViewController {
    
    var maskname: String?
    var imageNames: [String]?
    var maskdescription: String?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var seeAllMasks: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "No Mask Found"
        imageView.isHidden = true
        text.isHidden = true
        if let maskname = maskname {
            title = maskname
        }
        if let theImageNames = imageNames {
            print(theImageNames)
            imageView.isHidden = false
            if theImageNames.count > 1 {
                imageView.image = UIImage(named: (theImageNames.randomElement())!)
            } else {
                imageView.image = UIImage(named: theImageNames[0])
            }
        }
        if let maskdescription = maskdescription {
            text.isHidden = false
            text.text = maskdescription
        }
        
        if isMaskResult == false {
            seeAllMasks.isHidden = true
        } else {
            seeAllMasks.isHidden = false
        }
    }
    @IBAction func seeMasks(_ sender: Any) {
        performSegue(withIdentifier: "seeAllMasks", sender: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupLargeTitleAutoAdjustFont()
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
