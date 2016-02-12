//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func getNextImage() ->  String {
    var random = arc4random_uniform(10)
    if random == 0 {
        random = 1
    }
    
    if (random < 10) {
        return "0\(random)"
    } else {
        return "\(random)"
    }
}

getNextImage()
getNextImage()

