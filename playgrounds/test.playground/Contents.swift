import UIKit

let str = "a👿b🇩🇪c"
let r1 = str.range(of: "🇩🇪")!

// String range to NSRange:
let n1 = NSRange(r1, in: str)
print((str as NSString).substring(with: n1)) // 🇩🇪
// NSRange back to String range:
let r2 = Range(n1, in: str)!
print(str.substring(with: r2)) //

print(str[r2])
