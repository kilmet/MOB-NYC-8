//
//  SimpleCalculatorTests.swift
//  SimpleCalculatorTests
//
//  Created by William Martin on 10/27/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import XCTest
@testable import SimpleCalculator

class SimpleCalculatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    // The Calculator instance to be tested.
    let calculator = Calculator()
    
    
    // Test calculator input against an expected answer.
    func runTest(expectedAnswer expectedAnswer:Double, userTyped:[Key]) {
        calculator.clearAll()
        
        for key in userTyped {
            calculator.type(key)
        }
        
        let computedAnswer = calculator.getResult()
        
        if expectedAnswer == computedAnswer {
            XCTAssert(true)
            
        } else if Double.abs(expectedAnswer - computedAnswer) < 0.001 {
            // Sometimes the Double's precision bites us, so test the abs value of the difference
            // against an acceptable epsilon value. Also means we can't make tests that do weird
            // division.
            XCTAssert(true)
            
        } else {
            XCTAssert(false, "Oops, expected \(expectedAnswer) but got \(computedAnswer)")
            
        }
    }

    
    
    func testSimple() {
        // Simple, base calculation.
        runTest(expectedAnswer:3.0, userTyped:[.One, .Plus, .Two, .Equals])
        // Check for state being carried between tests.
        runTest(expectedAnswer:3.0, userTyped:[.One, .Plus, .Two, .Equals])
    }
    
    func testRepeat() {
        // Equals should repeat the last calc.
        runTest(expectedAnswer:5.0, userTyped:[.One, .Plus, .Two, .Equals, .Equals])
        runTest(expectedAnswer:21.0, userTyped:[.One, .Plus, .Two, .Times, .Three, .Equals, .Equals])
    }
    
    
    
    // Order of operations.
    
    func testOrderOfOperations01() {
        // 2 * 3 * 4
        runTest(
            expectedAnswer: 24.0,
            userTyped: [.Two, .Times, .Three, .Times, .Four, .Equals]
        )
    }
    
    func testOrderOfOperations02() {
        // 2 * 3 + 4
        runTest(
            expectedAnswer: 10.0,
            userTyped: [.Two, .Times, .Three, .Plus, .Four, .Equals]
        )
    }
    
    func testOrderOfOperations03() {
        // 2 + 3 * 4
        runTest(
            expectedAnswer: 14.0,
            userTyped: [.Two, .Plus, .Three, .Times, .Four, .Equals]
        )
    }
    
    func testOrderOfOperations04() {
        // 2 * 3 + 4 * 5
        runTest(
            expectedAnswer: 26.0,
            userTyped: [.Two, .Times, .Three, .Plus, .Four, .Times, .Five, .Equals]
        )
    }
    
    func testOrderOfOperations05() {
        // 2 * 3 + 4 * 5 * 6
        runTest(
            expectedAnswer: 126.0,
            userTyped: [.Two, .Times, .Three, .Plus, .Four, .Times, .Five, .Times, .Six, .Equals]
        )
    }
    
    func testOrderOfOperations06() {
        // 1 * 2 + 3 * 4
        runTest(
            expectedAnswer: 14.0,
            userTyped: [.One, .Times, .Two, .Plus, .Three, .Times, .Four, .Equals]
        )
    }
    
    func testOrderOfOperations07() {
        // 1 * 2 + 3 * 4 + 5
        runTest(
            expectedAnswer: 19.0,
            userTyped: [.One, .Times, .Two, .Plus, .Three, .Times, .Four, .Plus, .Five, .Equals]
        )
    }
    
    func testOrderOfOperations08() {
        // 1 * 2 + 3 * 4 + 5 * 6
        runTest(
            expectedAnswer: 44.0,
            userTyped: [.One, .Times, .Two, .Plus, .Three, .Times, .Four, .Plus, .Five, .Times, .Six, .Equals]
        )
    }
    
    func testOrderOfOperations09() {
        // 1 * 2 + 3 * 4 + 5 * 6 + 7
        runTest(
            expectedAnswer: 51.0,
            userTyped: [.One, .Times, .Two, .Plus, .Three, .Times, .Four, .Plus, .Five, .Times, .Six, .Plus, .Seven, .Equals]
        )
    }
    
    func testMultipleDigits() {
        // Type multiple digits.
        runTest(expectedAnswer:42.0, userTyped:[.Four, .Zero, .Plus, .Two, .Equals])
        runTest(expectedAnswer:46.0, userTyped:[.One, .Two, .Plus, .Three, .Four, .Equals])
        runTest(expectedAnswer:2.1, userTyped:[.One, .Dot, .One, .Plus, .One, .Equals])
    }
    
    
    func testLastResultChaining() {
        // A new calculation based on the last result.
        runTest(expectedAnswer:44.0, userTyped:[.Four, .Zero, .Plus, .Two, .Equals, .Plus, .Two, .Equals])
    }
    
    func testChaining() {
        // Implicit equals when chaining operations together.
        runTest(expectedAnswer:20.0, userTyped:[.Two, .Zero, .Plus, .Five, .Minus, .Five, .Equals])
    }
    
    func testOperatorOverride() {
        // Should enable correcting the operation.
        runTest(expectedAnswer:6.0, userTyped:[.Two, .Plus, .Divide, .Minus, .Times, .Three, .Equals])
        
        runTest(expectedAnswer:4.0, userTyped:[.One, .Plus, .Six, .Times, .Divide, .Two, .Equals])
    }
    
    func testPercentage() {
        // Percentage operation.
        runTest(expectedAnswer:7.2, userTyped:[.One, .Two, .Zero, .Times, .Six, .Percent, .Equals])
        runTest(expectedAnswer:224.0, userTyped:[.Two, .Zero, .Zero, .Plus, .One, .Two, .Percent, .Equals])
        runTest(expectedAnswer:0.05, userTyped:[.Five, .Percent])
        runTest(expectedAnswer:0.05, userTyped:[.Five, .Percent, .Equals])
        
        // New tests
        runTest(expectedAnswer:0.02, userTyped:[.Two, .Percent, .Equals])
        runTest(expectedAnswer:0.02, userTyped:[.Two, .Percent])
        runTest(expectedAnswer:2.04, userTyped:[.Two, .Plus, .Percent, .Equals])
        
        runTest(expectedAnswer:3.04, userTyped:[.Two, .Plus, .Percent, .Equals, .Plus, .One, .Equals])
        
        runTest(expectedAnswer:0.04, userTyped:[.Two, .Times, .Percent, .Equals])
        
        runTest(expectedAnswer:0.12, userTyped:[.Two, .Times, .Percent, .Equals, .Times, .Three, .Equals])
        
        runTest(expectedAnswer:2.06, userTyped:[.Two, .Plus, .Three, .Percent, .Equals])
        runTest(expectedAnswer:6.0, userTyped:[.Two, .Plus, .Three, .Percent, .Four, .Equals])
        runTest(expectedAnswer:6.06, userTyped:[.Two, .Plus, .Three, .Percent, .Plus, .Four, .Equals])
        runTest(expectedAnswer:2.3, userTyped:[.Two, .Plus, .Three, .Percent, .Times, .Five, .Equals])
        
        runTest(expectedAnswer:3.02, userTyped:[.Two, .Percent, .Plus, .Three, .Equals])
        runTest(expectedAnswer:0.06, userTyped:[.Two, .Times, .Three, .Percent, .Equals])
        runTest(expectedAnswer:0.06, userTyped:[.Two, .Percent, .Times, .Three, .Equals])
        
        runTest(expectedAnswer:1.06, userTyped:[.One, .Plus, .Two, .Times, .Three, .Percent, .Equals])
        runTest(expectedAnswer:1.04, userTyped:[.One, .Plus, .Two, .Times, .Percent, .Equals])
    }
    
    /*
    func testPercentOperatorOverride() {
        // 2 + 3 + % * =
        runTest(expectedAnswer:11.0, userTyped:[.Two, .Plus, .Three, .Plus, .Percent, .Times, .Equals])
        // 2 + 3 + % * = =
        runTest(expectedAnswer:33.0, userTyped:[.Two, .Plus, .Three, .Plus, .Percent, .Times, .Equals, .Equals])
    }
    */
    
    // After hitting % followed by an operator, the original input should be used, not the %-altered one.
    func testCancelledPercentage() {
        runTest(expectedAnswer:3.0, userTyped:[.Two, .Plus, .Percent, .Plus, .One, .Equals])
        runTest(expectedAnswer:6.0, userTyped:[.Two, .Times, .Percent, .Times, .Three, .Equals])
    }
    
    func testPercentageOperatorInteraction() {
        // Base case
        // 2 + 3 * 4 % =
        runTest(expectedAnswer:2.12, userTyped:[.Two, .Plus, .Three, .Times, .Four, .Percent, .Equals])
        
        // 2 + 3 * 4 + % =
        // ^ ^ ^ ^ ^ = 14
        // 14 + 4 * (14 * 0.01)
        runTest(expectedAnswer:14.56, userTyped:[.Two, .Plus, .Three, .Times, .Four, .Plus, .Percent, .Equals])
    }
    
    func testPercentageInconsistency() {
        // 10 + 12 % =
        runTest(expectedAnswer:22.4, userTyped:[.Two, .Zero, .Plus, .One, .Two, .Percent, .Equals])
        // 10 + 3 * 4 % =
        runTest(expectedAnswer:20.12, userTyped:[.Two, .Zero, .Plus, .Three, .Times, .Four, .Percent, .Equals])
        // 10 + 2 * 3 * 2 % =
        runTest(expectedAnswer:20.12, userTyped:[.Two, .Zero, .Plus, .Two, .Times, .Three, .Times, .Two, .Percent, .Equals])
    }
    
    func testClear() {
        // Testing clearing values.
        runTest(expectedAnswer:3.0, userTyped:[.Five, .Clear, .One, .Plus, .Two, .Equals])
        runTest(expectedAnswer:3.0, userTyped:[.One, .Plus, .Five, .Clear, .Two, .Equals])
        runTest(expectedAnswer:3.0, userTyped:[.Five, .Plus, .Five, .ClearAll, .One, .Plus, .Two, .Equals])
        
        runTest(expectedAnswer:7.0, userTyped:[.One, .Plus, .Two, .Times, .Clear, .Three, .Equals])
        runTest(expectedAnswer:9.0, userTyped:[.One, .Plus, .Two, .Times, .Three, .Clear, .Four, .Equals])
    }
    
    func testErrors() {
        // Testing erroneous calcs.
        runTest(expectedAnswer:Double.infinity, userTyped:[.One, .Divide, .Zero, .Equals])
    }
    
    func testNegate() {
        runTest(expectedAnswer:5.0, userTyped:[.Two, .Minus, .Negate, .Three, .Equals])
        runTest(expectedAnswer:5.0, userTyped:[.Two, .Minus, .Three, .Negate, .Equals])
        
        runTest(expectedAnswer:-5.0, userTyped:[.Negate, .Two, .Minus, .Three, .Equals])
        runTest(expectedAnswer:-5.0, userTyped:[.Two, .Negate, .Minus, .Three, .Equals])
        
        runTest(expectedAnswer:-5.0, userTyped:[.Negate, .Two, .Plus, .Negate, .Three, .Equals])
        runTest(expectedAnswer:-5.0, userTyped:[.Two, .Negate, .Plus, .Three, .Negate, .Equals])
    }
    
    func testMultipleEquals() {
        runTest(expectedAnswer:4.0, userTyped:[.One, .Plus, .Equals, .Equals, .Equals])
        runTest(expectedAnswer:5.0, userTyped:[.One, .Plus, .Equals, .Equals, .Equals, .Equals])
        runTest(expectedAnswer:10.0, userTyped:[.One, .Plus, .Two, .Times, .Equals, .Equals])
    }
    
}
