//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var age: Int = 15

func doSomething(){
//    var age = 50
    print(age)
}

doSomething()

enum Rating {
    case Good,Bad,NotRated
}

var rating : Rating = .Good

class Car {
    var make: String
    var age: Int
    var rating: Rating?
    var nickName: String?
    
    init(make: String, age: Int) {
        self.make = make
        self.age = age
    }
    
    func isItAGoodCar() -> Bool {
        if rating == .Good {
            return true
        } else {
            return false
        }
    }
}

var fordContour = Car(make: "Ford", age: 8)
fordContour.rating = .Good

var redJetta = Car(make: "VW", age: 0)
redJetta.rating = .Good


fordContour.age

var greenishColor = UIColor(red: 0.2, green: 1.0, blue: 0.5, alpha: 1.0)
var blueishColor = UIColor(red: 0.2, green: 0.4, blue: 1.0, alpha: 1.0)



class Driver {
    var name: String = ""
    var primaryCar : Car? = nil
}

var currentTime = NSDate()
var timeFormatter = NSDateFormatter()
timeFormatter.timeStyle = .MediumStyle
timeFormatter.stringFromDate(currentTime)


var cars: [Car] = [redJetta,fordContour]















