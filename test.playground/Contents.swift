import UIKit

let str = "a👿b🇩🇪c"
let r1 = str.range(of: "🇩🇪")!

// String range to NSRange:
let n1 = NSRange(r1, in: str)
print((str as NSString).substring(with: n1)) // 🇩🇪
// NSRange back to String range:
let r2 = Range(n1, in: str)!
print(str.substring(with: r2)) //

print(str[r2])

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


public class C: NSObject {
    @objc dynamic public func method() { print("C") }
}

public class B: C {
//    override public func method() { print("B") }
}
extension B {
  override public func method() { print("B") }
}

public class A: B {
//    override public func method() { print("A") }
}
extension A {
    override public func method() { print("A") }
}

(A() as A).method()
(A() as B).method()
(A() as C).method()

let tableHeight: Double? = 100
if let h = tableHeight {
    if h>85.0 {
        print("The table is too high!")
    }
}

func test (_ tableHeight: Double?) {
    guard let h = tableHeight else {
        print("------------")
        return;
    }
    if h>85.0 {
        print("The table is too high!")
    }
}

test(75)

func albumReleased(in year: Int) -> String?
{
    if year == 2000 {
        return "Yesterday Once More"
    }
    if year == 2020 {
        return "Taylor Swift"
    }
    return nil
}

var year = 2020
var album = albumReleased(in: year)? .uppercased()
print("\(album ?? "unkown".uppercased()) is realsed in \(year)")




