//
//  AccountTableViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 20/8/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit

class AccountTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let defaults = UserDefaults.standard
    var prefix = "Set"
    var pref2 = "Setting"
    var longPressed = false
    @IBOutlet weak var pfp: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.hideKeyboardWhenTappedAround() 
        pfp.layer.masksToBounds = true
        pfp.layer.cornerRadius = pfp.bounds.width / 2
        // pfp.imageView?.contentMode = .scaleToFill
        if let imageThing = defaults.string(forKey: "pfpFileDir") {
            pfp.setBackgroundImage(UIImage(contentsOfFile: imageThing), for: .normal)
            prefix = "Change"
        }
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self,  selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self,  selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
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
    override func viewWillAppear(_ animated: Bool) {
        if let name = defaults.string(forKey: "UserName") {
            nameTextField.text = name
        } else {
            nameTextField.text = ""
        }
    }
    @IBAction func tap(_ sender: Any) {
        let image = UIImagePickerController()
        // var newImage: UIImage
        image.delegate = self
        let alert = UIAlertController(title: "\(prefix) Profile Photo", message: "Profile Photo to be used within Viraze, for personalisation", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Take Picture", style: .default, handler: { action in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                image.sourceType = .camera
                image.allowsEditing = true
                self.present(image, animated: true, completion: nil)
                self.prefix = "Change"
            } else {
                print("Camera Unavailable")
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { action in
            image.sourceType = .photoLibrary
            image.allowsEditing = true
            self.present(image, animated: true, completion: nil)
            self.prefix = "Change"
        }))
        alert.addAction(UIAlertAction(title: "Remove Profile Picture", style: .destructive, handler: {
            action in
            self.defaults.removeObject(forKey: "pfpFileDir")
            self.pfp.setBackgroundImage(UIImage(named: "Viraze Placeholder Icon"), for: .normal)
            self.prefix = "Set"
        }))
        if prefix == "Set" {
            alert.actions[3].isEnabled = false
        } else {
            alert.actions[3].isEnabled = true
        }
        present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var newImage: UIImage

        if let possibleImage = info[.editedImage] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info[.originalImage] as? UIImage {
            newImage = possibleImage
        } else {
            return
        }

            // print(newImage.size)

        let imageData = newImage.pngData()!
        let docDir = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let imageURL = docDir.appendingPathComponent("profilepicture.png")
        try! imageData.write(to: imageURL)
        defaults.set(imageURL.path, forKey: "pfpFileDir")
        if let imageThing = defaults.string(forKey: "pfpFileDir") {
            pfp.setBackgroundImage(UIImage(contentsOfFile: imageThing), for: .normal)
        } else {
            pfp.setBackgroundImage(UIImage(named: "Viraze Placeholder Icon"), for: .normal)
        }

        dismiss(animated: true)
    }
        
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    

    @IBAction func hideKeyboard(_ sender: UITextField) {
        sender.resignFirstResponder()
        if !(nameTextField.text!.isEmpty){
            defaults.setValue(nameTextField.text!, forKey: "UserName")
        } else {
            defaults.removeObject(forKey: "UserName")
        }
    }
    @IBAction func longPress(_ sender: Any) {
        nameTextField.resignFirstResponder()
        if longPressed == false {
            performSegue(withIdentifier: "editNameInDepth", sender: nil)
            longPressed = true
        }
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
