import Darwin
import Foundation

enum MyError: Error {
    case notNumber(Character)
    case infinite
    case notString
}

struct CustomError: Error {
    var code: Int
    var file: String
    var line: Int
    
    var localizedDescription: String {
        "Error \(code) in file \(file) line \(line)"
    }
}

func functionCanThrow() throws -> Void {
//    throw MyError.notNumber("a")
    throw CustomError(code: 1000, file: #file, line: #line)
}

func testThrow() {
    do {
        try functionCanThrow()
    } catch let  err as CustomError {
        print("CustomError：\(err.localizedDescription)")
    }catch let err as MyError {
        switch err {
        case .notNumber(let char):
            print("MyError.notNumber: \(char)")
        case .infinite:
            print("MyError.infinite: \(err.localizedDescription)")
        case .notString:
            print("MyError.notString: \(err.localizedDescription)")
        }
//        if case .notNumber(let char) = err {
//            print("MyError.notNumber: \(char)")
//        }
    }catch {
        print("\(error.localizedDescription)")
    }
}

testThrow()
print("bye-bye!")


