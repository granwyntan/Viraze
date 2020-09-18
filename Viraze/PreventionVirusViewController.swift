//
//  PreventionVirusViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 17/9/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit
import SafariServices

class PreventionVirusViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var titleHeaderText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let newcancelButton = UIButton(frame: CGRect(x: view.bounds.width-40, y: 40, width: 30, height: 30))
        newcancelButton.isUserInteractionEnabled = true
        newcancelButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        newcancelButton.addTarget(self, action: #selector(closeCard), for: .touchUpInside)
        newcancelButton.tintColor = .label
        newcancelButton.autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin]
        newcancelButton.scalesLargeContentImage = true
        self.view.addSubview(newcancelButton)
        titleHeaderText.text = "Prevention"
        text.text = """
        Protect yourself and others around you by knowing the facts and taking appropriate precautions. Follow advice provided by your local health authority.
        
        To prevent the spread of COVID-19:
         - Clean your hands often. Use soap and water, or an alcohol-based hand rub.
         - Maintain a safe distance from anyone who is coughing or sneezing.
         - Wear a mask when physical distancing is not possible.
         - Don’t touch your eyes, nose or mouth.
         - Cover your nose and mouth with your bent elbow or a tissue when you cough or sneeze.
         - Stay home if you feel unwell.
         - If you have a fever, cough and difficulty breathing, seek medical attention.
         - Calling in advance allows your healthcare provider to quickly direct you to the right health facility. This protects you, and prevents the spread of viruses and other infections.
        
        Masks
        Masks can help prevent the spread of the virus from the person wearing the mask to others. Masks alone do not protect against COVID-19, and should be combined with physical distancing and hand hygiene. Follow the advice provided by your local health authority.
        """
    }
    @objc func closeCard() {
        performSegue(withIdentifier: "closePreventionCard", sender: nil)
    }
    @IBAction func seeSource(_ sender: Any) {
        present(SFSafariViewController(url: URL(string: "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public")!), animated: true)
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
