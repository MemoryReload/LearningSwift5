infix operator &&& : LogicalConjunctionPrecedence

extension Bool {
    static func &&& (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
        if lhs == false {
            return false
        }
        if rhs() == false {
            return false
        }
        return true
    }
    
    static func && (lhs: String, rhs: Bool) -> String {
        "\(lhs) = \(rhs)"
    }
}


print(" expression = \( 0<2 &&& 1<3)")
print("abc"&&0<2)
