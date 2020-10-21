//take closure as parameters
func travel(to place: String, action: (String, Int) -> String){
    print("I'm traveling to \(place)")
    let desc = action("car",60)
    print(desc);
    print("I'm arrived!\n")
}

travel(to: "London") { (method: String, speed: Int) -> String in
   return "I'm now traveling by \(method) with speed \(speed) km/h"
}

//Trailing closure syntax
travel(to: "Willson"){ (method: String, speed: Int) -> String in
    return "I'm now traveling by \(method) with speed \(speed) km/h"
}

//Shorthand parameter names
travel(to: "Irish"){
    "I'm now traveling by \($0) with speed \($1) km/h"
}

//return closure as function return value
func makeTravelAction1(to place: String) -> (String, String) -> Void {
    return { (person: String, method: String) -> Void in
        print("I'm traveling to \(place) with \(person) by \(method).\n")
    }
}

func makeTravelAction2(to place: String) -> (String, String) -> Void {
    return {
        print("I'm traveling to \(place) with \($0) by \($1).\n")
    }
}

var travelAction = makeTravelAction1(to: "China")
travelAction("Jone","ship")
travelAction = makeTravelAction2(to: "Russia")
travelAction("Jacky","plane")

func makeIncreaseAction(from start: Int) -> (Int) -> Void {
    var counter = start
    return {
        counter += $0
        print("result: \(counter)")
    }
}

let increase = makeIncreaseAction(from: 0)
increase(1)
increase(1)
increase(1)

