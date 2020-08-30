//
//  SettingsViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 20/8/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

//    @IBOutlet weak var imageView: UIImageView!
//    var tgr: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        tgr = UITapGestureRecognizer(target: self, action: #selector(pfpTap))
//        imageView.layer.masksToBounds = true
//        imageView.layer.cornerRadius = imageView.bounds.width / 2
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        self.navigationController?.navigationBar.
//        imageView.removeGestureRecognizer(tgr)
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        imageView.addGestureRecognizer(tgr)
//        self.navigationController?.navigationBar.
//        //tgr.cancelsTouchesInView = false
//    }
    
    @IBAction func leaveSettings(_ sender: Any) {
        dismiss(animated: true, completion: nil)
//        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pfpTap(_ sender: Any) {
        let image = UIImagePickerController()
        // var newImage: UIImage
        image.delegate = self
        let alert = UIAlertController(title: "Set Profile Photo", message: "Lorem Ipsum", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Take Picture", style: .default, handler: { action in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                image.sourceType = .camera
                image.allowsEditing = true
                self.present(image, animated: true, completion: nil)
            } else {
                print("Camera Unavailable")
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { action in
            image.sourceType = .photoLibrary
            image.allowsEditing = true
            self.present(image, animated: true, completion: nil)
        }))
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
//        imageView.image = newImage

        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
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
