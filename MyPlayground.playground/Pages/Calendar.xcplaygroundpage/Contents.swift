import Foundation

let startDateStr = "2021-11-12 00:59:00"
let endDateStr = "2021-11-14 00:00:00"

let fmt = DateFormatter()
fmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
fmt.timeZone = TimeZone(secondsFromGMT: 8*3600)

let startDate = fmt.date(from: startDateStr)!
print("startDate = \(startDate)")
let endDate = fmt.date(from:endDateStr)!
print("endDate = \(endDate)")


let fmt1 = DateFormatter()
fmt1.dateFormat = "yyyy-MM-dd HH:mm:ss"
fmt1.locale = Locale(identifier: "fr_FR")
fmt1.timeZone = TimeZone(secondsFromGMT: 8*3600)

print("start = \(fmt1.string(from: startDate))")
print("end = \(fmt1.string(from: endDate))")

let component = Calendar.current.dateComponents([.day,.hour,.minute,.second], from: startDate, to: endDate)

