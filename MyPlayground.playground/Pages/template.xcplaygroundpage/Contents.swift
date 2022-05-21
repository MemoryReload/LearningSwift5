//: [Previous](@previous)

import Foundation
import UIKit

class Template <T: UIView> {
    var v: T
    
    init(_ view: T) {
        v = view
    }
    
    func test() {
        show()
    }
    
    func show()  {
        print("view = \(v)")
    }
}

extension Template where T: UITableViewCell  {
//    func test() {
//        show()
//    }
    
    func show() {
        print("cell = \(v)")
    }
}

class MyCell: UITableViewCell {
    
}

let cell = MyCell()
let t0 = Template(cell)

let v = UIView()
let t1 = Template(v)

t0.show()
t1.show()

print("---------------")

t0.test()
t1.test()
