func travel(to place: String, action: (String, Int) -> String){
    print("I'm traveling to \(place)")
    let desc = action("car",60)
    print(desc);
    print("I'm arrived!")
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
