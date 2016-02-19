//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol SaysHello {
    func sayHello()
}

class Dog: SaysHello {
    func sayHello() {
        print("woof")
    }
}

class Person: SaysHello{
    func sayHello() {
        print("hi!")
    }
}

func callSayHello(thing:SaysHello){
    thing.sayHello()
}

callSayHello(Dog())
callSayHello(Person())


