//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var name = "Arun"

var nameField : String = "Arun"


var name2 = "bob"
var age = 40

var dictionary = [name:age]

var a : String?

print(a)


var favoritePet : String? = "wally the cat"
var petsAge : Int? = 4

//favoritePet = "no pet"
//favoritePet = ""
//favoritePet = nil

petsAge = nil
//
if favoritePet == nil {
    print("its nil")
} else {
    if favoritePet!.containsString("cat") {
            print("cat lover!")
    } else {
            print("dog lover!")
    }
}

if favoritePet?.containsString("cat") == true {
    print("cat lover!")
} else {
    print("dog lover!")
}

favoritePet?.containsString("cat")
favoritePet = nil
favoritePet?.containsString("cat")

//
//if favoritePet.containsString("cat") {
//    print("cat lover!")
//} else {
//    print("dog lover!")
//}




