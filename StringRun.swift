/* This is a program that finds
   the largest run in the string.

   Sean McLeod
   2021/04/30
*/

extension String {
    /* this extension allows to get the nth character
    of a string, similar to Java's charAt*/
    var length: Int {
        return count
    }
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

func maxRun(stringToCheck: String) -> Int {
    // This function calculates height
    var maximumRun:Int = 1
    var latestRun:Int = 1

    for loopCounter in 0..<(stringToCheck.count) {
        if stringToCheck[loopCounter] == 
           stringToCheck[loopCounter - 1] {
               /* if a letter equals the letter before it,
               the latest run increases */
               latestRun += 1
               if latestRun > maximumRun {
                   /* if the latest run is greater than the max run,
                   latest run becomes the max run */
                   maximumRun = latestRun
               }
           } else {
               latestRun = 1
           }
    }
    // return parameter
    return maximumRun
}

let maximumRun:Int

print("This program will show the largest run "
      ,"of your input")

// input
print("Enter string: ")
let userString = readLine()

let stringToCheck = String(userString!)

// pass & accept parameters
maximumRun = maxRun(stringToCheck: stringToCheck)
// output
print("\nThe largest run is: \(maximumRun)")
