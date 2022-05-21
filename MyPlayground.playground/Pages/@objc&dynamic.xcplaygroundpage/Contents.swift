import Foundation

class ToObjcOrNotObjc {
  func performOperation() -> Int {
    return 42
  }

  @objc func performOcOperation() -> Int {
    return 42
  }

  @objc dynamic func performDynamicOperation() -> Int {
    return 42
  }
}

let q = ToObjcOrNotObjc()

q.performOperation()
q.performOcOperation()
q.performDynamicOperation()
