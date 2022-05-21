import Foundation

class Test {
    var p:Float = 1
    lazy var m: Float? = {
        print("m initialize")
        return 3*p
    }()
    
    lazy var n: Float = {
        print("n initialize")
        return 4*p
    }()
    {
        //now lazy is obervable.
        willSet {
            print("new_n = \(newValue)")
        }
        didSet {
            print("old_n = \(oldValue)")
        }
    }
    
    func sum() -> Float {
        m! + p
    }
    
    deinit {
        print("\(self.m ?? 0)")
    }
}

let t = Test()
let sum = t.sum
t.p += 2
let r1 = sum()
//print("sum = \(r1)")

let T = Test.self
let fp = T.sum
let f = fp(t)
let r2 = f()
//print("sum = \(r2)")

let t2 = Test()
t2.m = nil //This will not cause a reinitialize.
t2.m = 0.3
t2.n = 5

