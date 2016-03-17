//
//  ComputeModel.swift
//  SimpleCalculator
//
//  Created by William Martin on 10/27/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import Foundation

// Base class for a single calculation.
class Element {
    var hasPriority : Bool = true
    var isError : Bool { return false }
    
    init() {
        
    }
    
    func compute(left:Element, _ right:Element) -> Number {
        return Number(value:0)
    }
    
    var string : String {
        return "el"
    }
}

class Add : Element {
    override init() {
        super.init()
        self.hasPriority = false
    }
    
    override func compute(left:Element, _ right:Element) -> Number {
        let result = (left as! Number).value + (right as! Number).value
        return Number(value:result)
    }
    
    override var string : String {
        return "+"
    }
}

class Subtract : Element {
    override init() {
        super.init()
        self.hasPriority = false
    }
    
    override func compute(left:Element, _ right:Element) -> Number {
        let result = (left as! Number).value - (right as! Number).value
        return Number(value:result)
    }
    
    override var string : String {
        return "-"
    }
}

class Multiply : Element {
    override func compute(left:Element, _ right:Element) -> Number {
        let result = (left as! Number).value * (right as! Number).value
        return Number(value:result)
    }
    
    override var string : String {
        return "×"
    }
}

class Divide : Element {
    override func compute(left:Element, _ right:Element) -> Number {
        let leftNum = (left as! Number).value
        let rightNum = (right as! Number).value
        
        if rightNum == 0.0 {
            return DivideByZeroError()
        }
        
        let result = leftNum / rightNum
        return Number(value:result)
    }
    
    override var string : String {
        return "÷"
    }
}

class Percent : Element {
    override func compute(left:Element, _ right:Element) -> Number {
        let result = (left as! Number).value * (right as! Number).value / 100.0
        return Number(value:result)
    }
    
    func simpleCompute(right:Element) -> Number {
        let result = (right as! Number).value / 100.0
        return Number(value:result)
    }
    
    override var string : String {
        return "%"
    }
}

class Number : Element {
    var _value : Double
    var value : Double {
        get {
            if self.negated {
                return -self._value
            } else {
                return self._value
            }
        }
        set {
            self._value = newValue
        }
    }
    var negated = false
    
    init(value:Double) {
        self._value = value
        super.init()
    }
    
    func toggleNegation() {
        self.negated = !self.negated
    }
    
    override var string : String {
        return String(self.value)
    }
}


class Error : Number {
    override var isError : Bool { return true }
    
    init() {
        super.init(value:Double.infinity)
    }
    
    override var string : String {
        return "Error"
    }
}

class DivideByZeroError : Error {
    override var string : String {
        return "1/0!"
    }
}




