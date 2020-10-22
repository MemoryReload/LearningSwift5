import UIKit

//Default parameters
func greet(to name: String = "World", nicely: Bool = false){
    if nicely == true {
        print("Good morning, \(name)!")
    } else {
        print("Hello, \(name)!")
    }
}

greet()
greet(to: "Anna")
greet(to: "John", nicely: true)

//Variadic functions
func greet (_ friends: String...)
{
    for friend in friends {
        print("Hi, \(friend)")
    }
}

greet("John","Anna","Jone","William")
