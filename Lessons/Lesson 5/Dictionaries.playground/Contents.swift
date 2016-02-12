//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var cities = ["New York", "San Francisco", "Boston"]

cities.first
cities[0]
var newCities = cities + ["Washington"]
cities.append("Los Angeles")
cities
newCities

var numbers:[Int] = []

for i in 1...10 {
//    numbers+[i]
    numbers.append(i)
}

numbers

for city in cities {
    print("hello \(city)")
}



var knownLanguages = ["arun" : ["swift","objective-c"], "christian" : ["swift","java"]]
knownLanguages["arun"]?.count


var airportForACity = ["JFK" : "New York", "SFO" : "San Francisco", "BOS" : "Boston"]




airportForACity["JFK"]


airportForACity["LGA"]

/*
write a function that returns the city name given airport code
if not a know airport return "Unknown"
*/


func getCityName(airportCode: String) -> String {
    if(airportForACity[airportCode]==nil){
        return "Unknown"
    } else {
        return airportForACity[airportCode]!
    }
}

getCityName("LGA")
getCityName("")
getCityName("BOS")
getCityName("bos")

airportForACity.keys.first

for key in airportForACity.keys {
    print(key + " - " + airportForACity[key]!)
}

airportForACity["LGA"] = "New York"
airportForACity["JFK"] = "New York Kennedy"
airportForACity["LGA"] = "New York LGA"
airportForACity["LGA"] = nil
//airportForACity["LGA"] = "nil"

airportForACity.removeValueForKey("LGA")

for (code,city) in airportForACity {
    print("\(code) - \(city)")
}

enum CompassPoint {
    case North
    case South
    case West
    case East
}

var direction:String = "east"
var betterDirection:CompassPoint = .East

if direction == "East" {
    //wont ever pass
}
if betterDirection == .East {
    //easier to read and less mistakes
}

enum DaysOfTheWeek{
    case Sun,Mon,Tue,Wed,Thu,Fri,Sat
    
    func isWeekend() -> Bool {
        switch self {
        case Sun,Sat:
            return true
        case Mon,Tue,Wed,Thu,Fri:
            return false
        }
        
//        if self == .Sat || day == .Sun {
//            return true
//        } else {
//            return false
//        }
    }
    
}

var day = DaysOfTheWeek.Sat
day.isWeekend()




var anotherDay = DaysOfTheWeek.Thu
anotherDay.isWeekend()


var letter : Character = "a"
var anotherLetter: String = "a"





