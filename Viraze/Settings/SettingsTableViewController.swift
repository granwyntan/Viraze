//
//  SettingsTableViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 20/8/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func checkThemeAndUpdate() {
        if (defaults.object(forKey: "virazeTheme") != nil) {
            themeSwitch.isHidden = false
            themeSwitch.setOn(defaults.bool(forKey: "virazeTheme"), animated: true)
            if #available(iOS 13.0, *) {
                if defaults.bool(forKey: "virazeTheme") == false {
                    UIApplication.shared.windows.forEach { window in
                        window.overrideUserInterfaceStyle = .light
                    }
                    themeName.text = "Light"
                    themePickerView.selectRow(1, inComponent: 0, animated: true)
                } else if defaults.bool(forKey: "virazeTheme") == true {
                    UIApplication.shared.windows.forEach { window in
                        window.overrideUserInterfaceStyle = .dark
                    }
                    themeName.text = "Dark"
                    themePickerView.selectRow(2, inComponent: 0, animated: true)
                }
            }
        } else if (defaults.object(forKey: "virazeTheme") == nil) {
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .unspecified
            }
            themePickerView.selectRow(0, inComponent: 0, animated: true)
            themeName.text = "Default"
            themeSwitch.isHidden = true
        }
    }
    
    var themeOptions = ["Default", "Light", "Dark"]

    let defaults = UserDefaults.standard
    @IBOutlet weak var themeName: UITextField!
    @IBOutlet weak var themeSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        createToolbar()
        themePickerView.delegate = self
        themePickerView.dataSource = self
        themeName.inputView = themePickerView
        themeName.selectedTextRange = nil
        
//        themeName.textAlignment = .center
//        themeName.contentVerticalAlignment = .center
    }
    var themePickerView = UIPickerView()
    override func viewWillAppear(_ animated: Bool) {
        checkThemeAndUpdate()
    }

//    override func viewDidAppear(_ animated: Bool) {
//        if let name = defaults.string(forKey: "UserName") {
//            if name == "<@#dev!>" {
//                devCell.isHidden = false
//            } else {
//                devCell.isHidden = true
//            }
//        } else {
//            devCell.isHidden = true
//        }
//    }
    @IBAction func hideSettings(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func switchValChange(_ sender: Any) {
        defaults.set(themeSwitch.isOn, forKey: "virazeTheme")
        checkThemeAndUpdate()
    }
    
    func createToolbar() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //Customizations
//        toolBar.barTintColor = .systemGreen
//        toolBar.tintColor = .black
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        themeName.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            performSegue(withIdentifier: "seeAcct", sender: nil)
        } else if indexPath.row == 1 {
            performSegue(withIdentifier: "seeHelp", sender: nil)
        } else if indexPath.row == 2 {
            performSegue(withIdentifier: "seeMore", sender: nil)
        } else if indexPath.row == 4 {
            let alert = UIAlertController(title: "Are you sure you want to Sign Out?", message: "Your data and preferences will not be saved", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in
                self.defaults.removeObject(forKey: "UserName")
                self.defaults.removeObject(forKey: "pfpFileDir")
                self.defaults.removeObject(forKey: "TutorialPage")
//                if var viewControllers = self.navigationController?.viewControllers
//                {
//                    if viewControllers.contains(where: {
//                        return $0 is ViewController
//                    })
//                    {
//                        self.performSegue(withIdentifier: "logOut", sender: nil)
//                    } else {
//                        viewControllers.insert(ViewController(), at: 0)
//                        self.navigationController!.setViewControllers(viewControllers, animated:false)
                    //                        self.performSegue(withIdentifier: "logOut", sender: nil)
//                        self.present(ViewController(), animated: true, completion: nil)
//                let navigationController = UINavigationController.init(rootViewController: vc)
                self.navigationController?.setNavigationBarHidden(true, animated: false)
                self.navigationController?.viewControllers.removeAll()
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                vc.modalPresentationStyle = .fullScreen
                vc.modalTransitionStyle = .crossDissolve
                self.present(vc, animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: {action in}))
            self.present(alert, animated: true, completion: nil)
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

extension SettingsTableViewController {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return themeOptions.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return themeOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {
            defaults.removeObject(forKey: "virazeTheme")
            checkThemeAndUpdate()
        } else if row == 1 {
            defaults.setValue(false, forKey: "virazeTheme")
            checkThemeAndUpdate()
        } else if row == 2 {
            defaults.setValue(true, forKey: "virazeTheme")
            checkThemeAndUpdate()
        }
    }
}
