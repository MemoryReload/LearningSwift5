import UIKit

struct Rect{
    let name:String
    var width: Double
    var height: Double
    {
        willSet
        {
            print("rect height will update from: \(height) to: \(newValue)")
        }
        didSet {
            print("rect height has updated from: \(oldValue) to: \(height)")
        }
    }
    var area: Double {
        return width*height
    }
    mutating func scale(with rate: Double) {
        width = width*rate
        height = height*rate
    }
    func getPerimeter() -> Double {
        //this will throw an error, cause cannot call mutating func in nomutating func
        //scale(with: 0.5)
        width*2+height*2
    }
}

var rect1 = Rect(name:"rect1", width: 20, height: 20)
print("\(rect1.name) of width: \(rect1.width) height: \(rect1.height), area: \(rect1.area)")

//this will throw errors, because the let property cannot be changed after initialization
//rect1.name = "ssss"

rect1.scale(with: 0.5)
print("scaled \(rect1.name) of width: \(rect1.width) height: \(rect1.height), area: \(rect1.area)")

rect1.width = 20
rect1.height = 20
print("resetted \(rect1.name) of width: \(rect1.width) height: \(rect1.height), area: \(rect1.area)")

let rect2 = Rect(name:"rect2", width: 30, height: 30);
print("\(rect2.name) of width: \(rect2.width) height: \(rect2.height), area: \(rect2.area)")
print("perimeter of \(rect2.name) is \(rect2.getPerimeter())")
//code below will throw errors, cause the rect2 is unchangable.
//rect2.scale(with: 0.5)
//rect2.width = 30
//rect2.height = 30

struct Tree
{
    init() {
        print("initialize family tree!")
    }
}

struct User {
    var name = "Anonymous" //default value
    var age: Int
    lazy var familyTree = Tree()
    //this will throw an error, because self is not usable. we should use lazy property.
//    var greetings = {
//        "Hello \(familyTree)"
//    }()
    lazy var greetings = {
        "Hello \(familyTree)"
    }()
}

extension User {
    init() {
        age = 10
    }
}

let twostraws = User(name: "Paul", age: 38)
let anonymous = User(age:30)
//this would throw an error, becasue the lazy property will change the testUser
//let testUser = User()
var testUser = User()
testUser.familyTree

