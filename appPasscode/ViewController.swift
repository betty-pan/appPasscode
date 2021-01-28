//
//  ViewController.swift
//  appPasscode
//
//  Created by Betty Pan on 2021/1/28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var numBtns: [UIButton]!
    @IBOutlet var passcodeImageViews: [UIImageView]!
    
    var numbers = [0,1,2,3,4,5,6,7,8,9]
    var passcode = "1234"
    var entercode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func imageChange() {
        switch entercode.count {
        case 1:
            for i in 0...3 {
                passcodeImageViews[i].isHighlighted = true
                if i > 0 {
                    passcodeImageViews[i].isHighlighted = false
                }
            }
        case 2:
            for i in 0...3 {
                passcodeImageViews[i].isHighlighted = true
                if i > 1 {
                    passcodeImageViews[i].isHighlighted = false
                }
            }
        case 3:
            for i in 0...3 {
                passcodeImageViews[i].isHighlighted = true
                if i > 2 {
                    passcodeImageViews[i].isHighlighted = false
                }
            }
        case 4:
            for i in passcodeImageViews {
                i.isHighlighted = true
            }
            checkPasscode()
        default:
            for i in passcodeImageViews {
                i.isHighlighted = false
            }
        }
    }
    
    func checkPasscode() {
        if entercode == passcode {
            let controller = UIAlertController(title: "Corret", message: "Welcome Back!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (_) in
                self.reset()
            }
            controller.addAction(action)
            present(controller, animated: true, completion: nil)
            
        }else{
            let controller = UIAlertController(title: "Wrong", message: "Please Try Again!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            controller.addAction(action)
            present(controller, animated: true, completion: reset)
        }
    }
    
    func reset() {
        for i in passcodeImageViews {
            i.isHighlighted = false
        }
        entercode = ""
    }
    
    @IBAction func enterPasscde(_ sender: UIButton) {
        if entercode.count != 4 {
            if let inputNumber = sender.currentTitle {
                entercode.append(inputNumber)
            }
        }
        imageChange()
    }
    @IBAction func backward(_ sender: UIButton) {
        if entercode.count != 0 {
            entercode = String(entercode.dropLast(1))
            imageChange()
        }
    }
}

