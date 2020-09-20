//
//  TabBarController.swift
//  Viraze
//
//  Created by Granwyn Tan on 13/8/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // self.selectedIndex = 2
        self.navigationItem.hidesBackButton = true
        // tabBarController?.selectedIndex = 2
        defaults.setValue("HomeViewController", forKey: "LaunchViewController")
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
