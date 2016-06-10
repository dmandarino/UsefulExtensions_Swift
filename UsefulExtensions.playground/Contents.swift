//: UsefulExtensions: - Some useful extensions to help with Swift Development

import UIKit
import Foundation

extension String {
    
    var toFloat: Float? { return Float(self) }
    var toDouble: Double? { return Double(self) }
    var toInt: Int? { return Int(self) }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func trim() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
    
    func split(regex: String) -> [String] {
        
        do{
            let regEx = try NSRegularExpression(pattern: regex, options: NSRegularExpressionOptions())
            let stop = "<SomeStringThatYouDoNotExpectToOccurInSelf>"
            let modifiedString = regEx.stringByReplacingMatchesInString (self, options: NSMatchingOptions(), range: NSMakeRange(0, characters.count), withTemplate:stop)
            return modifiedString.componentsSeparatedByString(stop)
        } catch {
            return []
        }
    }
}

extension Int {
    var toCGFloat: CGFloat { return CGFloat(self) }
    var toFloat: Float { return Float(self) }
    var toDouble: Double { return Double(self) }
    var toString: String { return String(self) }
}

extension Float {
    var toCGFloat: CGFloat { return CGFloat(self) }
    var toInt: Int { return Int(self) }
    var toDouble: Double { return Double(self) }
    var toString: String { return String(self) }
}

extension Double {
    var toCGFloat: CGFloat { return CGFloat(self) }
    var toFloat: Float { return Float(self) }
    var toInt: Int { return Int(self) }
    var toString: String { return String(self) }
}

extension CGFloat {
    var toInt: Int { return Int(self) }
    var toFloat: Float { return Float(self) }
    var toDouble: Double { return Double(self) }
    var toString: String { return String(self) }
}

infix operator ^ { }

func ^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}

func ^ (radix: Double, power: Double) -> Double {
    return pow(Double(radix), Double(power))
}

func ^ (radix: Float, power: Float) -> Float {
    return pow(Float(radix), Float(power))
}

// Results ..
let i = Float(2) ^ Float(3)
print("2³ = \(i)") // Prints 2³ = 8
print("2³ = \(2 ^ 3)")

print(" Test   ".trim())

let string = "This is my    test".split("[ ]+")

let myString = "Just a test".split(" ")