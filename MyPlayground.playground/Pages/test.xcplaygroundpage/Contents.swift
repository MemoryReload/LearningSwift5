extension Dictionary {
  public subscript(key: Key, orInsert value: @autoclosure () -> Value) -> Value {
//    mutating get {
//      // We have to "mutate" the result of subscript[_:default:] in order
//      // to ensure an entry gets added, so we pass it inout to a function.
//        return { $0 }(&self[key, default: value()])
//    }
      
      mutating get {
          guard let v = self[key] else {
              let v = value()
              self[key] = v
              return v
          }
          return v
      }
  }
}

var dic = [String : Int] ()
dic["sss", default: 3]
print("sss = \(dic["sss"])")

dic["aaa", orInsert: 10]
print("aaa = \(dic["aaa"])")
