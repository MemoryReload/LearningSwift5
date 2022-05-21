import Foundation

struct SPerson
{
    var name : String
    var age : Int
}

var spersons = [SPerson]()
for _ in 0...3 {
    spersons.append(SPerson(name: "John", age: 5));
}

//This will not work, because p is copied struct, not a class referrence type.
for i in 0..<4{
    var p = spersons[i]
    p.name = "Alen"
}

//This directly access will work for good
for i in 0..<4{
    spersons[i].age = 8
}
spersons

//spersons.forEach { (sperson) in
//    sperson.name = "dddddddd"
//}
//
//for sperson in spersons {
//    sperson.name = "dddddd"
//}

var m_spersons = spersons.map {(sperson) -> SPerson in
//    sperson.name = "ddddd"
    var p = sperson
    p.name = "ddddd"
    return p
}

spersons
m_spersons

class Person: NSObject
{
    var name : String
    var age : Int
    init(name:String, age:Int) {
        self.name = name
        self.age = age
        super.init()
    }
}

var persons = [Person]()
for _ in 0...3 {
    persons.append(Person(name: "Anna", age: 5))
}

persons.forEach { (person) in
    person.name = "Joe"
}
persons

for person in persons {
    person.name = "Marry"
}
persons

var m_persons = persons.map { (person) -> Person in
    person.name = "Taylor"
    return person
}

persons
m_persons
persons == m_persons


