import Foundation

protocol TestProtocol {
    func test()  //commenting this will raise you a surprise!
}

extension TestProtocol {
    func test() {                   //protocol extension
        print("IMP in TestProtocol extension")
    }
}

//MARK: simple confirmation
class TestA: TestProtocol {
    func test() {     //implementation in class
        print("IMP in TestA")
    }
}

class TestB: TestProtocol {
    func test() {     //implementation in class
        print("IMP in TestB")
    }
}

class TestC: TestProtocol { } // empty implementation

//MARK: super class
class ClassA: TestProtocol {
    @objc dynamic func test() {     //implementation in class
        print("IMP in ClassA")
    }
}

class ClassB { }
extension ClassB: TestProtocol {
    @objc func test() {             //implementation in class extension
        print("IMP in ClassB")
    }
}

//MARK: override in subclass declaration
class ClassC: ClassA {
    override func test() {          //override in subclass
        print("IMP in ClassC")
    }
}
class ClassD: ClassB {
    override func test() {         //override in subclass
        print("IMP in ClassD")
    }
}

//MARK: override in subclass extension
class ClassE: ClassA {}
extension ClassE {
     override func test() {      //override in subclass extension
        print("IMP in ClassE")
    }
}

class ClassF: ClassB { }
extension ClassF {
    override func test() {      //overrride in subclass extension
        print("IMP in ClassF")
    }
}


let testA = TestA()
let testB = TestB()
let testC = TestC()

let a = ClassA()
let b = ClassB()
let c = ClassC()
let d = ClassD()
let e = ClassE()
let f = ClassF()

testA.test()
testB.test()
testC.test()

a.test()
b.test()
c.test()
d.test()
e.test()
f.test()

print("------------- convert as A --------------")
(c as ClassA).test()
(e as ClassA).test()
print("------------- convert as B --------------")
(d as ClassB).test()
(f as ClassB).test()
print("------- convert as TestProtocol --------")
(testA as TestProtocol).test()
(testB as TestProtocol).test()
(testC as TestProtocol).test()
(a as TestProtocol).test()
(b as TestProtocol).test()
(c as TestProtocol).test()
(d as TestProtocol).test()
(e as TestProtocol).test()
(f as TestProtocol).test()


