import UIKit

protocol Person {
    var id: Int {get}
    var name: String {get}
    var age: Int {get}
    var homeAddress: String {get}
}

extension Person
{
    func description() -> String {
        return "Person ID : \(id), name: \(name), age: \(age), address: \(homeAddress)"
    }
}

protocol Job {
    var id: Int {get}
    var organization:String {get}
    var workAddress: String {get}
}

extension Job
{
    func description() -> String {
        return "Job ID : \(id), organization: \(organization), address: \(workAddress)"
    }
}

protocol Student: Person, Job {
    var years: Int {get}
}

extension Student
{
    func description() -> String {
        return "Student \(name) is \(age) year-old at \(organization) for \(years) year-long study"
    }
}

class HarvodUniversityStudent: Student
{
    /*
     Be careful for this id at last, it cannot be different for Person or Job.
     If this is different thing, we should change the protocol to be different name.
     Old stuff, now we can define for per protocol, see example below.
     */
    var id: Int
    var name: String
    var age: Int
    var organization: String = "Harvod"
    var years: Int = 0
    var homeAddress: String = ""
    var workAddress: String = ""
    
    init(id:Int, name:String, age:Int) {
        self.id = id
        self.name = name
        self.age = age
    }
    
    //this will override the protocol extension implementation
    func description() -> String {
        return "\(organization) student \(name) is \(age) year-old for \(years) year-long study "
    }
}


extension HarvodUniversityStudent: Person {
//    you can never override class method from extension like OC category any more. what a pity!
//    func description() -> String {
//        return "class extension do damn things"
//    }
}

var s = HarvodUniversityStudent(id: 101, name: "John Snow", age: 22)
s.years = 4
s.homeAddress = "ShangHai,China"
s.workAddress = "Brooklyn,USA"
print(s.description())
print((s as Student).description()) //This is amazing, right?
print((s as Person).description())
print((s as Job).description())

print("-----------------------------------")


protocol Worker: Person, Job{
    var salary: Int {get}
}

class Engineer: Worker
{
    /*
     This id could be different for Person or Job.
     */
    @_implements(Person, id)
    var pid: Int
    @_implements(Job, id)
    var jid: Int
    
    var name: String
    var age: Int
    var subject: String
    var organization: String = ""
    var salary: Int = 0
    var homeAddress: String = ""
    var workAddress: String = ""
    
    init(id:Int,jobId:Int,name:String,age:Int,subject:String) {
        self.pid = id
        self.jid = jobId
        self.name = name
        self.age = age
        self.subject = subject
    }
    
    func description() -> String {
        return "Engineer \(name) is a \(age) year-old \(subject) engineer, working at \(organization) \(salary) $ per month"
    }
}

class SoftwareEngineer: Engineer
{
    init(id:Int, jobId:Int, name: String, age: Int) {
        super.init(id: id, jobId: jobId, name: name, age: age, subject: "Software")
    }
    
    override func description() -> String {
        return "\(subject) engineer \(name) is a \(age) year-old  engineer, working at \(organization) \(salary) $ per month"
    }
}

var e = SoftwareEngineer(id: 2020, jobId: 1, name: "Morty", age: 67)
print("Job ID: \((e as Job).id)")
print("Person ID: \((e as Person).id)")

print(e.description())
print((e as Engineer).description())//This has nothing special, polymorphism works.
print((e as Job).description()) //This is amazing, right?
print((e as Person).description())
