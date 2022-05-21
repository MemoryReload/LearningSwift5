//: [Previous](@previous)

import Foundation
import UIKit

struct Person{
    var name = "John"
    var age = 12
    var blood = "A"
    
    mutating func rest() {
        name = ""
        age = 0
        blood = ""
    }
}

class CustomView: UIView {
    var color: UIColor = .white
}

let cell = UITableViewCell()
let p = Person()
let vc = UIViewController()
let cv = CustomView(frame: .zero)
let mirror = Mirror(reflecting: p)
print("------------------ ")
print("children counts = \(mirror.children.count)")
for item in mirror.children {
    print("\(item.label ?? "") = \(item.value)")
}
print("------------------")
