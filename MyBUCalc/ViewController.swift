//
//  ViewController.swift
//  MyBUCalc
//
//  Created by Taylor on 2/2/17.
//  Copyright © 2017 Taylor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberField: UILabel!
    var enteringNum = false
    var firstNum = 0.0
    var secondNum = 0.0
    var optr = ""
    var decimalClicked = false
    var doubleValue = 0.0
   
    @IBAction func enterDigit(_ sender: UIButton) {
        let digit = sender.currentTitle
        
        if enteringNum {
            numberField.text = numberField.text! + digit!
        }
        else {
            numberField.text = digit
            enteringNum = true
        }
    }
    
    
    @IBAction func operation(_ sender: UIButton) {
        enteringNum = false
        decimalClicked = false
        firstNum = Double(numberField.text!)!
        optr = sender.currentTitle!
    }
    
    
    @IBAction func equals(_ sender: UIButton) {
        enteringNum = false
        decimalClicked = false
        var result = 0.0
        secondNum = Double(numberField.text!)!
        
        if optr == "+" {
            result = firstNum + secondNum
        }
        else if optr == "-" {
            result = firstNum - secondNum
        }
        else if optr == "*" {
            result = firstNum * secondNum
        }
        else if optr == "/" {
            result = firstNum / secondNum
        }
        else if optr == "" {
            return
        }
        else if optr == "" && doubleValue == 0.0 {
            return
        }
        
        if doubleValue == 0.0 && optr != "/" {
            numberField.text = "\(Int(result))"
        }
        else {
            numberField.text = "\(result)"
        }
    }
    
    @IBAction func convertDouble(_ sender: UIButton) {
        if decimalClicked {
            return
        }
        else if enteringNum {
            numberField.text = numberField.text! + "."
            decimalClicked = true
        }
        else {
            numberField.text = "0."
            enteringNum = true
            decimalClicked = true
        }
        
        
        let decimal: String? = numberField.text
        doubleValue = Double(decimal!)!
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

