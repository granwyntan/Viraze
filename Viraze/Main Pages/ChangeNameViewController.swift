//
//  ChangeNameViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 14/8/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit

class ChangeNameViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var removeButton: UIButton!
    let defaults = UserDefaults.standard
    var prefix = "Change"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 

        // Do any additional setup after loading the view.
        // defaults.setValue("ChangeNameViewController", forKey: "LaunchViewController")
        // removeButton.setTitleColor(.lightGray, for: .disabled)
        if let name = defaults.string(forKey: "UserName") {
            nameField.text = name
            prefix = "Change"
        } else {
            removeButton.isEnabled = false
            prefix = "Set"
            removeButton.alpha = 0.45
        }
        text.text = "\(prefix) Name"
        saveButton.isEnabled = false
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self,  selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self,  selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        self.navigationItem.hidesBackButton = true
    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    @objc func keyboardWillChange(notification: Notification) {
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        if notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification {
            view.frame.origin.y = -keyboardRect.height+20
        } else if notification.name == UIResponder.keyboardWillHideNotification {
            view.frame.origin.y = 0
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: self.view.window)
    }
    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
//        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func editingChange(_ sender: Any) {
        if !(nameField.text!.isEmpty){
            if let name = defaults.string(forKey: "UserName") {
                if nameField.text != name {
                    saveButton.isEnabled = true
                } else {
                    saveButton.isEnabled = false
                }
            } else {
                saveButton.isEnabled = true
            }
        } else {
            saveButton.isEnabled = false
        }
    }
    @IBAction func editingEnd(_ sender: Any) {
        /*if !(nameField.text!.isEmpty) {
            if todoitem != nil {
                } (nameTextField.text! != todoitem.name) && (doneSwitch.isOn != todoitem.done){
                    save.isEnabled = true
                } else if nameTextField.text! != todoitem.name {
                    save.isEnabled = true
                } else if doneSwitch.isOn != todoitem.done {
                    save.isEnabled = true
                } else {
                    save.isEnabled = false
                }
            } else {
                save.isEnabled = true
            }
    } else {
            save.isEnabled = false
        }*/
        if !(nameField.text!.isEmpty){
            if let name = defaults.string(forKey: "UserName") {
                if nameField.text != name {
                    saveButton.isEnabled = true
                } else {
                    saveButton.isEnabled = false
                }
            } else {
                saveButton.isEnabled = true
            }
        } else {
            saveButton.isEnabled = false
        }
    }
    @IBAction func hideKeyboard(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func changeNameSave(_ sender: Any) {
        if nameField.text!.count >= 20 {
            let alert = UIAlertController(title: "Error setting name", message: "Name is too long", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            save()
            dismiss(animated: true, completion: nil)
        }
//        if !(nameField.text!.isEmpty){
//            defaults.setValue(nameField.text!, forKey: "UserName")
//            nameField.text = ""
//            // dismiss(animated: true, completion: nil)
//            self.navigationController?.popViewController(animated: true)
//        } else {
//            let alert = UIAlertController(title: "Error saving name", message: "Name is blank", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            present(alert, animated: true, completion: nil)
//        }
    }
    @IBAction func changeNameCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
//        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func changeNameRemove(_ sender: Any) {
        let alert = UIAlertController(title: "Confirmation", message: "Are you sure you want to remove name?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.defaults.removeObject(forKey: "UserName")
            self.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func save() {
        defaults.setValue(nameField.text!, forKey: "UserName")
        nameField.text = ""
        dismiss(animated: true, completion: nil)
        // self.navigationController?.popViewController(animated: true)
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
