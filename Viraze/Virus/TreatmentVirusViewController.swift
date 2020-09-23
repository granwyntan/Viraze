//
//  TreatmentVirusViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 18/9/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit
import SafariServices

class TreatmentVirusViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var text: UITextView!
    //@IBOutlet weak var titlething: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let newcancelButton = UIButton(frame: CGRect(x: view.bounds.width-40, y: 40, width: 30, height: 30))
//        newcancelButton.isUserInteractionEnabled = true
//        newcancelButton.setImage(UIImage(systemName: "xmark"), for: .normal)
//        newcancelButton.addTarget(self, action: #selector(closeCard), for: .touchUpInside)
//        newcancelButton.tintColor = .label
//        newcancelButton.autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin]
//        newcancelButton.scalesLargeContentImage = true
//        self.view.addSubview(newcancelButton)
        title = "Treatment"
        image.isUserInteractionEnabled = true
        text.text = """
There are no vaccines nor specific antiviral treatments for COVID-19. Management involves the treatment of symptoms, supportive care, isolation, and experimental measures.

Self-care
If you feel sick you should rest, drink plenty of fluid, and eat nutritious food. Stay in a separate room from other family members, and use a dedicated bathroom if possible. Clean and disinfect frequently touched surfaces.
Everyone should keep a healthy lifestyle at home. Maintain a healthy diet, sleep, stay active, and make social contact with loved ones through the phone or internet. Children need extra love and attention from adults during difficult times. Keep to regular routines and schedules as much as possible.
It is normal to feel sad, stressed, or confused during a crisis. Talking to people you trust, such as friends and family, can help. If you feel overwhelmed, talk to a health worker or counsellor.

Medical treatments
If you have mild symptoms and are otherwise healthy, self-isolate and contact your medical provider or a COVID-19 information line for advice.
Seek medical care if you have a fever, a cough, and difficulty breathing. Call in advance.

There’s currently no treatment specifically approved for COVID-19, and no cure for an infection, although treatments and vaccines are currently under study.

Instead, treatment focuses on managing symptoms as the virus runs its course.

Seek medical help if you think you have COVID-19. Your doctor will recommend treatment for any symptoms or complications that develop and let you know if you need to seek emergency treatment.

Other coronaviruses like SARS and MERS are also treated by managing symptoms. In some cases, experimental treatments have been tested to see how effective they are.

Examples of therapies used for these illnesses include:
- Antiviral or retroviral medications
- Breathing support, such as mechanical ventilation
- Steroids to reduce lung swelling
- blood plasma transfusions
"""
    }
    
    @IBAction func sourcepress(_ sender: Any) {
        present(SFSafariViewController(url: URL(string: "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/question-and-answers-hub/q-a-detail/q-a-coronaviruses")!), animated: true)
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
    
    @IBAction func closeCard(_sender: Any) {
        DispatchQueue.global(qos: .background).async {

        // Background Thread

        DispatchQueue.main.async {
            self.navigationController?.navigationBar.isHidden = true
            }
        }
        performSegue(withIdentifier: "closeTreatmentCard", sender: nil)
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
