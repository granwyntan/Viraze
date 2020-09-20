//
//  NameViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 13/8/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        defaults.setValue("NameViewController", forKey: "LaunchViewController")
    }
    @IBAction func hideKeyboard(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func setName(_ sender: Any) {
        if !(nameField.text!.isEmpty){
            if nameField.text!.count >= 20 {
                let alert = UIAlertController(title: "Error setting name", message: "Name is too long", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            } else {
                defaults.setValue(nameField.text!, forKey: "UserName")
                nameField.text = ""
                if let name = defaults.string(forKey: "UserName") {
                    print(name)
            }
            self.performSegue(withIdentifier: "seeHomeScreen", sender: nil)
            }
        } else {
            let alert = UIAlertController(title: "Error setting name", message: "Name is Blank", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func skip(_ sender: Any) {
        self.performSegue(withIdentifier: "seeHomeScreen", sender: nil)
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
