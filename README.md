# UsefulExtensions_Swift

Some useful extensions and functions to Swift

Extensions
--------------
###Cast
To make cast clearer
  
```swift
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

```

###String
Some uswful cast and functions to String

```swift
extension String {
    
    var toFloat: Float? { return Float(self) }
    var toDouble: Double? { return Double(self) }
    var toInt: Int? { return Int(self) }
    
    //To return the value in NSLocalizedString
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    //To trim the String as Java 
    func trim() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
    
    // Will split the String and return the array. Also accepts regular Expressions
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
```

Functions
--------------
###Infix Operator
You can create some operators to avoid lines way too big and keep it clearer

```swift
//syntax to declare a infix operator
infix operator ^ { }

//Now you can use pow with Int
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
print("2³ = \(2 ^ 3)") // Prints 2³ = 8  

print(" Test   ".trim()) //"Test\n"

//Using Regular Expression
let string = "This is my    test".split("[ ]+") //["This", "is", "my", "test"]

let myString = "Just a test".split(" ") //["Just", "a", "test"]

```
