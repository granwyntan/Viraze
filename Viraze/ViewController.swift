//
//  ViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 13/8/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let defaults = UserDefaults.standard

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var desc: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        label.text = "Welcome\nTo\nViraze"
        desc.text = "App Description"
        defaults.setValue("ViewController", forKey: "LaunchViewController")
    }
    override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        let segue = UnwindScaleSegue(identifier: unwindSegue.identifier, source: unwindSegue.source, destination: unwindSegue.destination)
        segue.perform()
    }
    
    @IBAction func unwindLogout(segue: UIStoryboardSegue){
        
    }
    
    @IBAction func GetStarted(_ sender: Any) {
        performSegue(withIdentifier: "seeTutorial", sender: nil)
    }

}

