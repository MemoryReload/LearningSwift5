class Student
{
    var name: String = ""
    var age: Int = 0
    /*
     When all properties have default values, we don't need to define a customized initialization method.
     The compiler will make a default one `init()` for us.
     */
}

class UniversityStudent: Student
{
    var annualFees: Int
    
    init(fees:Int) {
        annualFees = 0 //this one is fucking needed, because initialization phase 1.
        super.init()
        annualFees = fees
    }
}

class UniversityStudent2: Student
{
    var annualFees: Int = 0 //this keeps initialization phase 1 damn good
    
    init(fees:Int) {
//        annualFees = 0 //now this could  be left out.
        super.init()
        annualFees = fees
    }
}

class UniversityStudent3: Student
{
    private(set) var annualFees: Int
    
    init(fees:Int) {
        self.annualFees = fees //looks strange, but all in one. the same to `annualFees = fees`
//        self.name = "annoymus" //This is not allowed, interesting! because `self` is only available after phase 2. but look line above, be careful, that's phase 1, the `self.annualFees` really mean `annualFees`
        super.init()
        self.name = "annoymus"
    }
    
    func changeFee(to fee: Int) {
        annualFees = fee
    }
    
    convenience override init() {
        self.init(fees:0)
    }
    
    deinit {
        print("instance destroyed")
    }
}

let s = UniversityStudent3()
//s.annualFees = 80 //This will throw an error, because the setter is private.
s.changeFee(to: 80)
print("the student \(s.name)'s annual fee is \(s.annualFees)")

final class FinalClass {
    
}

//final class can not be inherited any more
//class TestClass: FinalClass {
//
//}
