//
//  McqQnsViewController.swift
//  MCQTemplate
//
//  Created by Robin on 13/7/18.
//  Copyright © 2018 Robin. All rights reserved.
//



import UIKit

class McqQnsViewController: UIViewController {
    
    let timeAllowed = 0
    let qnsAsked = 4
    let totalQns:UInt32 = 10
    
    var score = 0
    var curQns = 0
    var qnsList : [Int] = []
    var correctAns = 1
    var timeLeft = -1
    var tt : Timer!
    

    @IBOutlet weak var label_CurrQnsNo: UILabel!
    @IBOutlet weak var label_TimeRemaining: UILabel!
    @IBOutlet weak var label_timeNo: UILabel!
    @IBOutlet weak var label_Qns: UILabel!
    @IBOutlet weak var img_Qns: UIImageView!
    @IBOutlet weak var btn_A: UIButton!
    @IBOutlet weak var btn_B: UIButton!
    @IBOutlet weak var btn_C: UIButton!
    @IBOutlet weak var btn_D: UIButton!
    @IBOutlet weak var btn_Next: UIButton!
    
    
    @IBAction func getAns(_ sender:UIButton) {
        if correctAns == sender.tag {
            //correct
            score += 1
            sender.layer.borderColor = UIColor.green.cgColor
        }
        else {
            //wrong
            sender.layer.borderColor = UIColor.red.cgColor
            switch correctAns {
            case 1: btn_A.layer.borderColor = UIColor.green.cgColor
            case 2: btn_B.layer.borderColor = UIColor.green.cgColor
            case 3: btn_C.layer.borderColor = UIColor.green.cgColor
            case 4: btn_D.layer.borderColor = UIColor.green.cgColor
            default: return
            }
        }
        if timeAllowed > 0 { tt.invalidate() }
        hideBtn(hide: false)
    }
    
    func hideBtn(hide : Bool) {
        btn_A.isEnabled = hide
        btn_B.isEnabled = hide
        btn_C.isEnabled = hide
        btn_D.isEnabled = hide
        btn_Next.isHidden = hide
    }
    
    func initQuiz() {
        score = 0
        curQns = 0
        qnsList.removeAll(keepingCapacity: false)
        var temp = 0
        while temp<qnsAsked {
            var unique = false
            while !unique {
                let randnum = Int(arc4random_uniform(totalQns))
                if qnsList.contains(randnum) {
                    continue
                }
                else {
                    unique = true
                    temp += 1
                    qnsList.append(randnum)
                }
            }
        }
        if timeAllowed > 0 {
            label_timeNo.text = "\(timeAllowed)"
        }
        else {
            label_timeNo.text = "--"
        }
        displayQns(qNo: qnsList[curQns])
    }
    
    @IBAction func nextQns(_ sender:UIButton) {
        curQns += 1
        if curQns < qnsAsked {
            displayQns(qNo: qnsList[curQns])
        }
        else {
            let alert = UIAlertController(title: "Quiz Completed", message: "You scored \(score)/\(qnsAsked)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Go Again", style: .default, handler: { action in self.initQuiz()}))
            alert.addAction(UIAlertAction(title: "Quit", style: .cancel, handler: { action in self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btn_A.layer.borderWidth = 2
        btn_B.layer.borderWidth = 2
        btn_C.layer.borderWidth = 2
        btn_D.layer.borderWidth = 2
        initQuiz()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func updateTimer() {
        timeLeft -= 1
        if timeLeft > 0 {
            label_timeNo.text = "\(timeLeft)"
        }
        else {
            label_timeNo.text = "0"
            tt.invalidate()
            switch correctAns {
            case 1: btn_A.layer.borderColor = UIColor.green.cgColor
            case 2: btn_B.layer.borderColor = UIColor.green.cgColor
            case 3: btn_C.layer.borderColor = UIColor.green.cgColor
            case 4: btn_D.layer.borderColor = UIColor.green.cgColor
            default: return
            }
            hideBtn(hide: false)
        }
    }
    
    func displayQns(qNo : Int) {
        label_CurrQnsNo.text = "Q\(curQns+1) of \(qnsAsked)"
        btn_A.layer.borderColor = UIColor.black.cgColor
        btn_B.layer.borderColor = UIColor.black.cgColor
        btn_C.layer.borderColor = UIColor.black.cgColor
        btn_D.layer.borderColor = UIColor.black.cgColor
        hideBtn(hide: true)
        if timeAllowed > 0 {
            timeLeft = timeAllowed
            label_timeNo.text = "\(timeLeft)"
            tt = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
        
        switch qNo {
        case 0:
            label_Qns.text = "What is empathy?"
            btn_A.setTitle("Long ans for testing the display to see if it can fit in everything", for: .normal)
            btn_B.setTitle("Test for B", for: .normal)
            btn_C.setTitle("Test for C", for: .normal)
            btn_D.setTitle("Test for D", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 1:
            label_Qns.text = "What is algorithm?"
            btn_A.setTitle("Long ans for testing the display to see if it can fit in everything", for: .normal)
            btn_B.setTitle("Test for B", for: .normal)
            btn_C.setTitle("Test for C", for: .normal)
            btn_D.setTitle("Test for D", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 2:
            label_Qns.text = "What is holistic?"
            btn_A.setTitle("Long ans for testing the display to see if it can fit in everything", for: .normal)
            btn_B.setTitle("Test for B", for: .normal)
            btn_C.setTitle("Test for C", for: .normal)
            btn_D.setTitle("Test for D", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 3:
            label_Qns.text = "What is impact?"
            btn_A.setTitle("Long ans for testing the display to see if it can fit in everything", for: .normal)
            btn_B.setTitle("Test for B", for: .normal)
            btn_C.setTitle("Test for C", for: .normal)
            btn_D.setTitle("Test for D", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 4:
            label_Qns.text = "What is trigonometry?"
            btn_A.setTitle("Long ans for testing the display to see if it can fit in everything", for: .normal)
            btn_B.setTitle("Test for B", for: .normal)
            btn_C.setTitle("Test for C", for: .normal)
            btn_D.setTitle("Test for D", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 5:
            label_Qns.text = "What is semipermeable membrane?"
            btn_A.setTitle("Long ans for testing the display to see if it can fit in everything", for: .normal)
            btn_B.setTitle("Test for B", for: .normal)
            btn_C.setTitle("Test for C", for: .normal)
            btn_D.setTitle("Test for D", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 6:
            label_Qns.text = "What is governance?"
            btn_A.setTitle("Long ans for testing the display to see if it can fit in everything", for: .normal)
            btn_B.setTitle("Test for B", for: .normal)
            btn_C.setTitle("Test for C", for: .normal)
            btn_D.setTitle("Test for D", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 7:
            label_Qns.text = "What is lorem ipsum?"
            btn_A.setTitle("Long ans for testing the display to see if it can fit in everything", for: .normal)
            btn_B.setTitle("Test for B", for: .normal)
            btn_C.setTitle("Test for C", for: .normal)
            btn_D.setTitle("Test for D", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 8:
            label_Qns.text = "What is future perfect tense?"
            btn_A.setTitle("Long ans for testing the display to see if it can fit in everything", for: .normal)
            btn_B.setTitle("Test for B", for: .normal)
            btn_C.setTitle("Test for C", for: .normal)
            btn_D.setTitle("Test for D", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 9:
            label_Qns.text = "What is methodology?"
            btn_A.setTitle("Long ans for testing the display to see if it can fit in everything", for: .normal)
            btn_B.setTitle("Test for B", for: .normal)
            btn_C.setTitle("Test for C", for: .normal)
            btn_D.setTitle("Test for D", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        
        case 10:
            label_Qns.text = ""
            btn_A.setTitle("", for: .normal)
            btn_B.setTitle("", for: .normal)
            btn_C.setTitle("", for: .normal)
            btn_D.setTitle("", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 11:
            label_Qns.text = ""
            btn_A.setTitle("", for: .normal)
            btn_B.setTitle("", for: .normal)
            btn_C.setTitle("", for: .normal)
            btn_D.setTitle("", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 12:
            label_Qns.text = ""
            btn_A.setTitle("", for: .normal)
            btn_B.setTitle("", for: .normal)
            btn_C.setTitle("", for: .normal)
            btn_D.setTitle("", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 13:
            label_Qns.text = ""
            btn_A.setTitle("", for: .normal)
            btn_B.setTitle("", for: .normal)
            btn_C.setTitle("", for: .normal)
            btn_D.setTitle("", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 14:
            label_Qns.text = ""
            btn_A.setTitle("", for: .normal)
            btn_B.setTitle("", for: .normal)
            btn_C.setTitle("", for: .normal)
            btn_D.setTitle("", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 15:
            label_Qns.text = ""
            btn_A.setTitle("", for: .normal)
            btn_B.setTitle("", for: .normal)
            btn_C.setTitle("", for: .normal)
            btn_D.setTitle("", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 16:
            label_Qns.text = ""
            btn_A.setTitle("", for: .normal)
            btn_B.setTitle("", for: .normal)
            btn_C.setTitle("", for: .normal)
            btn_D.setTitle("", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 17:
            label_Qns.text = ""
            btn_A.setTitle("", for: .normal)
            btn_B.setTitle("", for: .normal)
            btn_C.setTitle("", for: .normal)
            btn_D.setTitle("", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 18:
            label_Qns.text = ""
            btn_A.setTitle("", for: .normal)
            btn_B.setTitle("", for: .normal)
            btn_C.setTitle("", for: .normal)
            btn_D.setTitle("", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 19:
            label_Qns.text = ""
            btn_A.setTitle("", for: .normal)
            btn_B.setTitle("", for: .normal)
            btn_C.setTitle("", for: .normal)
            btn_D.setTitle("", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 20:
            label_Qns.text = ""
            btn_A.setTitle("", for: .normal)
            btn_B.setTitle("", for: .normal)
            btn_C.setTitle("", for: .normal)
            btn_D.setTitle("", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 21:
            label_Qns.text = ""
            btn_A.setTitle("", for: .normal)
            btn_B.setTitle("", for: .normal)
            btn_C.setTitle("", for: .normal)
            btn_D.setTitle("", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 22:
            label_Qns.text = ""
            btn_A.setTitle("", for: .normal)
            btn_B.setTitle("", for: .normal)
            btn_C.setTitle("", for: .normal)
            btn_D.setTitle("", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 23:
            label_Qns.text = ""
            btn_A.setTitle("", for: .normal)
            btn_B.setTitle("", for: .normal)
            btn_C.setTitle("", for: .normal)
            btn_D.setTitle("", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 24:
            label_Qns.text = ""
            btn_A.setTitle("", for: .normal)
            btn_B.setTitle("", for: .normal)
            btn_C.setTitle("", for: .normal)
            btn_D.setTitle("", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 25:
            label_Qns.text = ""
            btn_A.setTitle("", for: .normal)
            btn_B.setTitle("", for: .normal)
            btn_C.setTitle("", for: .normal)
            btn_D.setTitle("", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 26:
            label_Qns.text = ""
            btn_A.setTitle("", for: .normal)
            btn_B.setTitle("", for: .normal)
            btn_C.setTitle("", for: .normal)
            btn_D.setTitle("", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 27:
            label_Qns.text = ""
            btn_A.setTitle("", for: .normal)
            btn_B.setTitle("", for: .normal)
            btn_C.setTitle("", for: .normal)
            btn_D.setTitle("", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 28:
            label_Qns.text = ""
            btn_A.setTitle("", for: .normal)
            btn_B.setTitle("", for: .normal)
            btn_C.setTitle("", for: .normal)
            btn_D.setTitle("", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        case 29:
            label_Qns.text = ""
            btn_A.setTitle("", for: .normal)
            btn_B.setTitle("", for: .normal)
            btn_C.setTitle("", for: .normal)
            btn_D.setTitle("", for: .normal)
            img_Qns.image = UIImage(named: "")
            correctAns = 3
        default:
            break
        }
    }

}
