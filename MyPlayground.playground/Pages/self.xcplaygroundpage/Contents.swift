import Foundation

var a = Array<Int>()
type(of: a)
type(of: a.self)
type(of: Array<Int>.self)

class Test {
    static func classFunc () {
        type(of: self)
    }
    
    func instanceFunc() -> Self {
        type(of: self)
        return self
    }
}

protocol TestProtocol
{
    
}

type(of: TestProtocol.self)

Test.classFunc()
var test = Test()
test.instanceFunc()

let json = "{ \"test\" : 1 }"

struct Model: Codable {
    var test: Double
}

if let jsonD = json.data(using: .utf8) {
    let m = try? JSONDecoder().decode(Model.self, from: jsonD)
    if let _m = m, let v = _m.test as? Double {
        print("v = \(v)")
    }else {
        print("this is fucked up!")
    }
}
