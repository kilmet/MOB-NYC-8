//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var topRandomRed : CGFloat = 0
var topRandomGreen : CGFloat = 0
var topRandomBlue : CGFloat = 0


func getRandomFloat() -> CGFloat {
    let randomFloat = CGFloat(arc4random_uniform(100))/100.0
    return randomFloat
}

func getRandomColor() -> UIColor {
    topRandomRed = getRandomFloat()
    topRandomGreen = getRandomFloat()
    topRandomBlue = getRandomFloat()
    return UIColor(red: topRandomRed, green: topRandomGreen , blue: topRandomBlue , alpha: 1.0)
}

var color = getRandomColor()

var newColor = UIColor(red: topRandomRed-1.2, green: topRandomGreen, blue: topRandomBlue, alpha: 1.0)

