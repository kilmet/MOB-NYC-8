//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by William Martin on 10/27/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // The Calculator instance that does the heavy lifting.
    let calculator = Calculator()

    @IBOutlet weak var display: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateUI(false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // All the buttons have an integer tag that corresponds to the "keys" Dictionary defined in
    // Constants.swift.
    @IBAction func userTappedDigit(sender:UIButton) {
        let key = keys[sender.tag]!
        calculator.type(key)
        self.updateUI(true)
    }
    
    @IBAction func userTappedOperation(sender:UIButton) {
        let key = keys[sender.tag]!
        calculator.type(key)
        
        if key == .Percent {
            self.display.text = String(calculator.percentValue)
        } else {
            self.updateUI(false)
        }
    }
    
    @IBAction func userTappedDot(sender:UIButton) {
        let key = keys[sender.tag]!
        calculator.type(key)
        self.updateUI(true)
    }
    
    @IBAction func userTappedNegate(sender:UIButton) {
        let key = keys[sender.tag]!
        calculator.type(key)
        self.updateUI(true)
    }
    
    @IBAction func userTappedClear(sender:UIButton) {
        let key = keys[sender.tag]!
        calculator.type(key)
        self.updateUI(false)
    }
    
    @IBAction func userTappedAllClear(sender:UIButton) {
        let key = keys[sender.tag]!
        calculator.type(key)
        self.updateUI(false)
    }
    
    @IBAction func userTappedEquals(sender:UIButton) {
        let key = keys[sender.tag]!
        calculator.type(key)
        self.updateUI(false)
    }
    
    // Causes the label to display the current state of the calculator, either the user's input
    // or the most recent result.
    func updateUI(showInput:Bool) {
        if self.calculator.hasError {
            self.display.text = "Error"
            return
        }
        
        if showInput {
            if let _input = self.calculator.input {
                self.display.text = _input
            } else {
                if self.calculator.negate {
                    self.display.text = "-0.0"
                } else {
                    self.display.text = "0.0"
                }
            }
        } else {
            let result = self.calculator.getResult()
            self.display.text = String(result)
        }
    }
}

