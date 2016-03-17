//
//  Engine.swift
//  SimpleCalculator
//
//  Created by William Martin on 10/27/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import Foundation

// The Engine class actually performs the calculations and holds the state of the calculator.
class Engine {
    
    // Contains the numbers and operations the user has typed.
    var stack : [Element] = []
    
    // Helps to enable multiple equals.
    var hold : [Element] = []
    
    // Remember the last actual input and keeping track of when operators are tapped
    // is needed for the percent operation.
    var lastInput = Number(value:0.0)
    var operatorWasEnteredBeforePercent : Bool = false
    
    
    func clear() {
        if self.stack.last is Number {
            self.stack.popLast()
        }
        self.hold = []
    }
    
    func clearAll() {
        self.stack = []
        self.hold = []
        self.lastInput = Number(value:0.0)
    }

    func pushInput(value:Double) {
        let newInput = Number(value:value)
        
        if self.stack.last is Number {
            self.stack[self.stack.count - 1] = newInput
        } else {
            self.stack.append(newInput)
        }
        
        self.lastInput = newInput
    }
    
    
    func negateInput() {
        if self.stack.last is Number {
            (self.stack.last as! Number).toggleNegation()
        } else {
            let negativeZero = Number(value:0)
            self.stack.append(negativeZero)
        }
    }
    
    // The behavior of the calculator depends on how many operations and numbers have been
    // placed onto the stack, and what those operations are.
    //
    // There can't be more than 5 elements on the stack. e.g. 1 + 2 * 3
    func pushOperation(operation:Operation) {
        guard let op = elementForOperation[operation] else { return }
        
        self.hold = []
        
        if self.stack.count == 0 {
            self.stack.append(Number(value:0.0))
        }
        
        if self.stack.last is Number {
            
            // When operators are entered just before a percent, we should discard
            // the last operator and number on the stack. It effectively undoes
            // what was entered before.
            // 2 + 3 + % * = 11
            if self.operatorWasEnteredBeforePercent {
                if self.stack.count - 2 >= 0 {
                    self.stack = Array(self.stack[0..<self.stack.count-2])
                }
                self.operatorWasEnteredBeforePercent = false
            }
            
            // Push the operator onto the stack if the last was a number.
            self.stack.append(op)
            
        } else {
            // If the last thing on the stack is an operator, replace it with this one.
            // e.g. 2 + * 3 =
            self.stack[self.stack.count - 1] = op
        }
        
        self.collapse()
        self.collapse()
    }
    
    private func collapse() {
        // Compute these cases:
        // 1 * 2 *
        // ^ ^ ^
        // 1 + 2 +
        // ^ ^ ^
        // 1 + 2 * 3 *
        //     ^ ^ ^
        if self.stack.count > 3 {
            let (op1index, _, op1, op2) = self.getLastTwoOperators()
            
            // Look for:
            // * *
            // + +
            // * +
            if !(!op1.hasPriority && op2.hasPriority) {
                let result1 = op1.compute(self.stack[op1index - 1], self.stack[op1index + 1])
                self.stack = self.stack[0..<op1index-1] + [result1] + self.stack[op1index+2..<self.stack.count]
            }
        }
    }
    
    // Get the last two operators in the stack.
    private func getLastTwoOperators() -> (Int, Int, Element, Element) {
        var ops = [Int]()
        for var i = self.stack.count - 1; i >= 0; i-- {
            let elt = self.stack[i]
            if !(elt is Number) {
                ops = [i] + ops
            }
        }
        
        let op1index = ops[ops.count - 2]
        let op2index = ops[ops.count - 1]
        
        let op1 = self.stack[op1index]
        let op2 = self.stack[op2index]
        
        return (op1index, op2index, op1, op2)
    }
    
    func printStack() {
        print(
            self.stack.map({$0.string}).joinWithSeparator(" "), " ",
            self.hold.map({$0.string}).joinWithSeparator(" "),
            "| last input =", self.lastInput.value
        )
    }
    
    // Calculate by reducing the stack to the minimum number of elements possible by collapsing
    // the computations in order. Also keeps the last operation around to enable chaining operations.
    func calculate() {
        guard self.stack.count != 0  else { return }
        
        if self.stack.count % 2 == 0 {
            self.stack.append(self.stack[self.stack.count - 2])
        }
        
        if self.hold.count > 0 {
            self.stack += self.hold
        }
        
        if self.stack.count == 1 {
            // We're done!
            return
        }
        
        // This routine presupposes that the most complex expression is:
        // 1 + 2 * 3
        
        // Collapses the last 3 elements in the stack and appends the result. Returns the last
        // operation and number for multiple equals operations.
        func calc() -> [Element] {
            let count = self.stack.count
            
            let left = self.stack[count - 3]
            let op = self.stack[count - 2]
            let right = self.stack[count - 1]
            
            let result = op.compute(left, right)
            
            self.stack = self.stack[0..<(count-3)] + [result]

            return [op, right]
        }
        
        self.hold = calc()
        if self.stack.count > 2 {
            calc()
        }
        
    }
    
    // Get the index of the last Number and last Operator on the stack.
    private func getLastNumberAndOperator() -> (lastNum:Int, lastOp:Int) {
        var lastNum = -1
        var lastOp = -1
        for i in 0..<self.stack.count {
            let elt = self.stack[i]
            if elt is Number {
                lastNum = i
            } else {
                lastOp = i
            }
        }
        return (lastNum:lastNum, lastOp:lastOp)
    }
    
    // Handles the percentage cases, like 100 + 5 % =, which will equal 105.0 and show the 
    // intermediate percentage value.
    //
    // The percent operator really just acts on the last entered number, changing that value
    // depending on the last operation entered.
    func calculatePercentage() {
        guard self.stack.count > 0 else { return }
        
        let (lastNum, lastOp) = self.getLastNumberAndOperator()
        guard lastNum != -1 else { return }
        
        // 2 + %
        // 2 + 3 %
        // 2 + 3 * %
        // 2 + 3 * 4 %
        // 2 + 3 * 4 + %
        
        self.operatorWasEnteredBeforePercent = lastOp > lastNum
        
        var percentValue = (self.stack[lastNum] as! Number).value * 0.01
        
        if lastOp != -1 && !self.stack[lastOp].hasPriority {
            // + or -
            
            let leftIndex = lastNum - 2 > 0 ? lastNum - 2 : 0
            let left = self.stack[leftIndex] as! Number
            
            // TODO: Sometimes, left should be decomposed into its previous elements.
            percentValue = left.value * self.lastInput.value * 0.01
        }
        
        // Put the new percentage value onto the stack.
        let val = Number(value:percentValue)
        if lastOp > lastNum {
            self.stack.append(val)
        } else {
            self.stack[lastNum] = val
        }
    }
    
    var percentValue : Double {
        if self.stack.last is Number {
            return (self.stack.last as! Number).value
        }
        return 0.0
    }
}

