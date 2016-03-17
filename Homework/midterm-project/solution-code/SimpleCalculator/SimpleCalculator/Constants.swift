//
//  Constants.swift
//  SimpleCalculator
//
//  Created by William Martin on 10/27/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import Foundation

// The keys present on the calculator.
enum Key {
    case Plus
    case Minus
    case Times
    case Divide
    case Percent
    case Negate
    
    case Equals
    
    case Zero
    case One
    case Two
    case Three
    case Four
    case Five
    case Six
    case Seven
    case Eight
    case Nine
    
    case Dot
    
    case Clear
    case ClearAll
    
    case Null
    
}

// All the operations a user can perform in the calculator.
enum Operation {
    case None
    
    case Addition
    case Subtraction
    case Multiplication
    case Division
    
    case Percentage
    case Negation
}

// Tags mapping to keys. So a UIButton can have an integer tag that refers to a Key.
let keys : [Int:Key] = [
    1:.One,
    2:.Two,
    3:.Three,
    4:.Four,
    5:.Five,
    6:.Six,
    7:.Seven,
    8:.Eight,
    9:.Nine,
    10:.Zero,
    
    11:.Negate,
    
    12:.Dot,
    
    13:.Plus,
    14:.Minus,
    15:.Times,
    16:.Divide,
    
    17:.ClearAll,
    18:.Clear,
    
    19:.Equals,
    
    20:.Percent
]

// Maps Keys to the operations they can perform.
let operationForKey : [Key: Operation] = [
    .Plus : .Addition,
    .Minus : .Subtraction,
    .Times : .Multiplication,
    .Divide : .Division
]

// Maps operations to the actual instances of those calculator elements that perform
// the calculations. "Element" is a bad name for that class.
let elementForOperation : [Operation : Element] = [
    .Addition : Add(),
    .Subtraction : Subtract(),
    .Multiplication : Multiply(),
    .Division : Divide(),
    .Percentage : Percent()
]

// Convenience Dictionary to make it easier to display keys the user taps.
let digitForKey : [Key: String] = [
    .Zero : "0",
    .One : "1",
    .Two : "2",
    .Three : "3",
    .Four : "4",
    .Five : "5",
    .Six : "6",
    .Seven : "7",
    .Eight : "8",
    .Nine : "9",
    .Dot : "."
]

