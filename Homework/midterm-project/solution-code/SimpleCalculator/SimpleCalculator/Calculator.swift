//
//  Calculator.swift
//  SimpleCalculator
//
//  Created by William Martin on 10/27/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import Foundation


// The base class that accepts user input and performs the proper operatons on the 
// calculation "Engine". Also manages the display of values to the end user.
class Calculator {
    
    // The object that actually performs the calculations.
    private var engine = Engine()
    
    // Holds the digits the user has input.
    private var _input : String? = nil
    
    // Holds whether the input should be negated or not.
    var negate : Bool = false
    
    // Compute a String that represents the current user input.
    var input : String? {
        get {
            if let __input = self._input {
                if negate {
                    return "-" + __input
                } else {
                    return __input
                }
            } else {
                return nil
            }
        }
        
        set {
            self._input = newValue
        }
    }
    
    // Compute the value the user has input.
    var inputValue : Double? {
        if let _input = self.input {
            return Double(_input)
        }
        return nil
    }
    
    func clearAll() {
        self.input = nil
        self.engine.clearAll()
    }
    
    func clear() {
        self.input = nil
        self.engine.clear()
    }
    
    var hasError : Bool {
        if let first = self.engine.stack.first {
            return first.isError
        }
        return false
    }
    
    // Gets the current result from the compute Engine instance.
    func getResult() -> Double {
        if let first = self.engine.stack.first {
            if first is Number {
                return (first as! Number).value
            }
        }
        return 0
    }
    
    var percentValue : Double {
        return self.engine.percentValue
    }
    
    // The Calculator instance thinks of input in terms of key presses, but the Engine 
    // thinks of input in terms of whole values. This function pushes what's in the
    // Calculator's input buffer into the Engine as a whole Double value.
    private func pushInput() {
        if let value = self.inputValue {
            self.engine.pushInput(value)
            self.input = nil
            self.negate = false
        }
    }
    
    func type(key:Key) {
        if key == .Clear {
            self.clear()
            
        } else if key == .ClearAll {
            self.clearAll()
            
        } else if key == .Equals {
            self.pushInput()
            self.engine.calculate()
        
        } else if key == .Negate {
            self.negate = !self.negate
        
        } else if isOperation(key) {
            self.pushInput()
            self.engine.pushOperation(operationForKey[key]!)
            
        } else if key == .Percent {
            self.pushInput()
            self.engine.calculatePercentage()
            
        } else {
            
            if let digit = digitForKey[key] {
                
                if let digits = self._input {
                    self._input = digits + digit
                } else {
                    self.input = "\(digit)"
                }
                
            }
            
        }
    }
    
    func isOperation(key:Key) -> Bool {
        return operationForKey[key] != nil
    }
}

