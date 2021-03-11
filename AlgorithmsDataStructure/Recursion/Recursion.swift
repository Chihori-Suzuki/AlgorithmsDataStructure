//
//  Recursion.swift
//  AlgorithmsDataStructure
//
//  Created by 鈴木ちほり on 2021/03/09.
//

import Foundation

// 1. power(base, exponent) -> base^exponent
// Assume exponent >+ 0

func power(base: Int, exponent: Int) -> Int {
    
    if exponent == 0 {
        return 1
    }
    return base * power(base: base, exponent: exponent - 1)
}

//2.

func isPalindrome(_ word: String) -> Bool {
    // word.count / 2
    if (word.count <= 1) {
        return true
    }
    //    if let first = word.first, let last = word.last, first == last {
    //        return isPalindrome(word[1, word.count - 1])
    //    }
    return false
}

func printBinary(_ n: Int) {
    if (n == 1) {
        print()
        return
    }
    print("-", terminator: "")
}

// 4. revertseLines
func revertseLines(_ line: Int)  {
    let contents = try! String(contentsOfFile: "/Users/suzukichihori/Cornerstone/WMAD/Swift_Algorithms&DataStructures/AlgorithmsDataStructure/AlgorithmsDataStructure/Recursion/provinces.txt", encoding: .utf8)
    let lines = contents.split(separator: "\n")
    
    if line < lines.count {
        revertseLines(line + 1)
        print(lines[line])
    }
    
    print(lines)
    
}


// 5. evaluate

func evaluate(_ ex: String) -> Int {
    var trimedEx = ex.trimmingCharacters(in: .whitespacesAndNewlines)
    
    //1+(1+4)*1+(3+2)+1
    if trimedEx.contains("(") {
        let startPlace = trimedEx.lastIndex(of: "(")!
        let indexOfLeftPar = trimedEx.index(trimedEx.startIndex, offsetBy: startPlace.utf16Offset(in: trimedEx) + 1) // place of "("
        
        let newEx = trimedEx[indexOfLeftPar...]
        let endPlace = newEx.firstIndex(of: ")")!
        let indexOfRightPar = newEx.index(indexOfLeftPar, offsetBy: endPlace.utf16Offset(in: newEx) - 1) // place of ")"
        
        let removeStr = String(newEx[...indexOfRightPar])
        
        let expression = NSExpression(format: removeStr)
        let answer = expression.expressionValue(with: nil, context: nil) as! Int
        print(answer)
        
        if let range = trimedEx.range(of: "(\(removeStr))") {
            trimedEx.replaceSubrange(range, with: "\(answer)")
        }
        return evaluate(trimedEx)
        
    } else {
        return Int(ex)!
    }
}


// (1+3)+((1+2)*5) -> (1+3)+(3*5)
// (1+3)+(3*5) -> (1+3)+15
// (1+3)+15 -> 4+15
// 4+15 -> 19
     
