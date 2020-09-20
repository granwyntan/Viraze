//
//  PickMasksViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 19/9/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit

class PickMasksViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var maskquestionnumber = 0
    var data = [Int]()
    var question = String()
    var options = [String]()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count+1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row == 0 {
            return ""
        } else {
            return options[row-1]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevQuestion: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        picker.delegate = self
        picker.dataSource = self
        goToNextQuestion()
        prevQuestion.setTitleColor(.lightGray, for: .disabled)
        if maskquestionnumber > 1 {
            prevQuestion.isEnabled = true
        } else {
            prevQuestion.isEnabled = false
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row > 0 {
            nextButton.isEnabled = true
            if data.count == maskquestionnumber {
                data[maskquestionnumber-1] = row
                //print("Row", row, "Q", maskquestionnumber-1)
            } else {
                data.append(row)
                //print("Row", row, "Q", maskquestionnumber-1)
            }
        } else {
            nextButton.isEnabled = false
        }
    }
    
    func loadQuestion() {
        questionText.text = question
        picker.reloadAllComponents()
    }
    
    func goToNextQuestion(){
        maskquestionnumber += 1
        question = masksQuestions[maskquestionnumber-1].question
        options = masksQuestions[maskquestionnumber-1].options
        loadQuestion()
        if data.count >= maskquestionnumber {
            picker.selectRow(data[maskquestionnumber-1], inComponent: 0, animated: true)
            nextButton.isEnabled = true
        } else {
            picker.selectRow(0, inComponent: 0, animated: true)
            nextButton.isEnabled = false
        }
        if maskquestionnumber > 1 {
            prevQuestion.isEnabled = true
        } else {
            prevQuestion.isEnabled = false
        }
    }
    
    func goToPreviousQuestion() {
        maskquestionnumber -= 1
        question = masksQuestions[maskquestionnumber-1].question
        options = masksQuestions[maskquestionnumber-1].options
        loadQuestion()
        if maskquestionnumber > 1 {
            prevQuestion.isEnabled = true
        } else {
            prevQuestion.isEnabled = false
        }
        picker.selectRow(data[maskquestionnumber-1], inComponent: 0, animated: true)
        nextButton.isEnabled = true
    }
    
    @IBAction func nextQuestion(_ sender: Any) {
        if maskquestionnumber-1 < masksQuestions.count-1 {
            goToNextQuestion()
        } else {
            performSegue(withIdentifier: "seeMaskChosen", sender: nil)
        }
    }
    @IBAction func previousQuestion(_ sender: Any) {
        if maskquestionnumber >= 1 {
            goToPreviousQuestion()
        }
    }
    
    @IBAction func closeCard(_ sender: Any) {
        performSegue(withIdentifier: "closeMaskChooser", sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "seeMaskChosen" {
            let destVC = segue.destination as! ShowMasksViewController
            var maskNumber = Int()
            if data[0] == 1 && data[1] == 2 && data[2] == 1 && data[3] == 2 && data[4] == 2 && data[5] == 2 {
                print("Surgical Mask")
                maskNumber = 0
            } else if data[0] == 2 && data[1] == 2 && data[2] == 2 && data[3] == 3 && data[4] == 2 && data[5] == 2 {
                print("N95 (Valved)")
                maskNumber = 1
            } else if data[0] == 2 && data[1] == 2 && data[2] == 2 && data[3] == 3 && data[4] == 2 && data[5] == 3 {
                print("N95 (No Valve)")
                maskNumber = 2
            } else if data[0] == 2 && data[1] == 2 && data[2] == 2 && data[3] == 2 && data[4] == 1 && data[5] == 2 {
                print("Fabric Mask")
                maskNumber = 3
            } else if data[0] == 1 && data[1] == 1 && data[2] == 2 && data[3] == 2 && data[4] == 1 && data[5] == 2 {
                maskNumber = 7
            } else if data[0] == 2 && data[1] == 2 && data[2] == 2 && data[3] == 2 && data[4] == 1 && data[5] == 3 {
                maskNumber = 8
            } else if data[0] == 1 && data[1] == 1 && data[2] == 2 && data[3] == 2 && data[4] == 1 && data[5] == 3 {
                maskNumber = 9
            } else if data[0] == 2 && data[1] == 2 && data[2] == 2 && data[3] == 1 && data[4] == 1 && data[5] == 1 {
                maskNumber = 10
            } else {
                maskNumber = -1
            }
            if maskNumber >= 0 {
                destVC.maskname = masks[maskNumber].name
                destVC.imageNames = masks[maskNumber].imageName
                destVC.maskdescription = masks[maskNumber].description
            }
        }
    }

}
