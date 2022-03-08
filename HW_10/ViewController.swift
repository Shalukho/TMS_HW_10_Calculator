//
//  ViewController.swift
//  HW_10
//
//  Created by Анастасия Шалухо on 7.03.22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: IBOutlet
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet var buttonNambers: [UIButton]!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: Override properties
    
    var result : Double = 0
    var firstNumber : Double = 0
    var operation : Int = 0
    var operationSign : Bool = false
   
    //MARK: Override methods
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        buttons.forEach {button in
            button.layoutIfNeeded()
            button.layer.cornerRadius = button.frame.height / 2
        }
        
        buttonNambers.forEach {buttonNamber in
            buttonNamber.layoutIfNeeded()
            buttonNamber.layer.cornerRadius = buttonNamber.frame.height / 2
        }
    }
    
    //MARK: IBAction
    
    @IBAction func numbers(_ sender: UIButton) {
        if operationSign == true {
            resultLabel.text = String(sender.tag)
            operationSign = false
        }
        else { resultLabel.text = resultLabel.text!
            +  String(sender.tag)
        }
        result = Double (resultLabel.text!)!
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if resultLabel.text != "" && sender.tag != 11 && sender.tag != 18 {
            firstNumber = Double(resultLabel.text!)!
            operation = sender.tag
            operationSign = true
        }
         if sender.tag == 18 {
            if operation == 14 {
                resultLabel.text = String(firstNumber / result)
            }
            else if operation == 15 {
                resultLabel.text = String(firstNumber * result)
            }
            else if operation == 16 {
                resultLabel.text = String(firstNumber - result)
            }
            else if operation == 17 {
                resultLabel.text = String(firstNumber + result)
            }
            else if operation == 12 {
                 resultLabel.text = String(-firstNumber)
            }
            else if operation == 13 {
                 resultLabel.text = String(firstNumber/100)
                 }
        }
        else if sender.tag == 11 {
            resultLabel.text = ""
            firstNumber = 0
            result = 0
            operation = 0
        }
    }
}

