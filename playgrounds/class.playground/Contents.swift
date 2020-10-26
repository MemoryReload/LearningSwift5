class Student
{
    var name: String = ""
    var age: Int = 0
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
    var annualFees: Int
    init(fees:Int) {
        annualFees = fees //looks strange, but all in one.
        super.init()
    }
    
    convenience override init() {
        self.init(fees:0)
    }
}

let s = UniversityStudent3()
print("the student fee is \(s.annualFees)")

