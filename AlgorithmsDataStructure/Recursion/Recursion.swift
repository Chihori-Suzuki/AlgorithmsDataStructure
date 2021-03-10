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
    //    if ex.count <= 1 { return Int(ex)!}
    
    //1+(1+4)*1+(3+2)+1
    if ex.contains("(") {
        let startPlace = ex.lastIndex(of: "(")!
        let indexOfLeftPar = ex.index(ex.startIndex, offsetBy: startPlace.utf16Offset(in: ex) + 1) // place of "("
        
        let newEx = ex[indexOfLeftPar...]
        let endPlace = newEx.firstIndex(of: ")")!
        let indexOfRightPar = newEx.index(indexOfLeftPar, offsetBy: endPlace.utf16Offset(in: newEx) - 1) // place of ")"
        
        //        print(ex[ex.index(after: startPlace)])
        //        print(ex[indexOfRightPar])
        //        print(newEx[...indexOfRightPar])
        
        let removeStr = String(newEx[...indexOfRightPar])
        
        let expression = NSExpression(format: removeStr)
        let answer = expression.expressionValue(with: nil, context: nil) as! Int
        print(answer)
        
        let firstStr = ex[...ex.index(ex.startIndex, offsetBy: startPlace.utf16Offset(in: ex) - 1)] //
        let lastStr = newEx[newEx.index(indexOfLeftPar, offsetBy: endPlace.utf16Offset(in: newEx) + 1)...] //
        let newStr = firstStr + String(answer) + lastStr
        
        return evaluate(String(newStr))
        
    } else {
        let expression = NSExpression(format: ex)
        let answer = expression.expressionValue(with: nil, context: nil) as! Int
        return answer
    }
    //    return 1
}


// ((1+3)+((1+2)*5))
