////
////  Dynamic Programming.swift
////  AlgorithmsDataStructure
////
////  Created by Chiori Suzuki on 2021/04/19.
////
//
//import Foundation
//

//func climbStairs(int n) {
//        if (n <= 2) {
//            return n;
//        }
//        var d = new int[n + 1];
//        d[1] = 1;
//        d[2] = 2;
//        for (int i = 3; i <= n; i++) {
//            d[i] = d[i-1] + d[i-2];
//        }
//        return d[n];
//    }

//// 1. define the subproblem
//// d[n] = for n, the min number of operations to make 1
//// 2. guess
//// how this starts?
//// 3. recurrence
//// d[n] = min(d[n/3] + 1, d[n/2] + 1, d[n-1] + 1)
func makeOne(_ n: Int) -> Int {
    var d = [Int](repeating: 0, count: n + 1)
    d[1] = 0
    for i in 2...n {
        d[i] = d[i - 1] + 1 // Subtract 1
        if i % 2 == 0 && d[i] > d[i / 2] + 1 {
            d[i] = d[i / 2] + 1
        }
        if i % 3 == 0 && d[i] > d[i / 3] + 1 {
            d[i] = d[i / 3] + 1
        }
    }
    return d[n]
}
//var d = [Int](repeating: 0, count: 1000001)
//func MakeOneTopBottom(_ n: Int) -> Int {
//    if n == 1 {
//        return 0;
//    }
//    if d[n] > 0 {
//        return d[n]
//    }
//    d[n] = makeOneTopBottom(n - 1) + 1
//    if n % 2 == 0 {
//        let tmp = makeOneTopBottom(n / 2) + 1
//        d[n] = d[n] > tmp ? tmp : d[n]
//    }
//    if n % 3 == 0 {
//        let tmp = makeOneTopBottom(n / 3) + 1
//        d[n] = d[n] > tmp ? tmp : d[n]
//    }
//    return d[n]
//}

//// 1. define the subproblem
//// d[n] = # of possible ways to fill up 2xN
//// d[1] = 1
//// d[2] = 2
//// 2. guess
//// end
//// 3. recurrence
//// d[n] = d[n-1] + d[n-2]
//func twoByNTiles(_ n: Int) -> Int {
//    if n <= 2 { return n }
//    var d = [Int](repeating: 0, count: n + 1)
//    d[1] = 1
//    d[2] = 2
//    for i in 3...n {
//        d[i] = d[i - 1] + d[i - 2]
//    }
//    return d[n]
//}

//func twoByNTiles(_ n: Int) -> Int {
//    if n <= 1 { return n }
//    var d = [Int](repeating: 0, count: n + 1)
//    d[1] = 1
//    d[2] = 3
//    for i in 3...n {
//        d[i] = d[i - 1] + d[i - 2] * 2
//    }
//    return d[n]
//}
//func oneTwoThree() {
//    var d = [Int](repeating: 0, count: 12)
//    d[1] = 1
//    d[2] = 2
//    d[3] = 4
//    for i in 4...11 {
//        d[i] = d[i - 1] + d[i - 2] + d[i - 3]
//    }
//    var t = Int(readLine()!)!
//    while t > 0 {
//        let n = Int(readLine()!)!
//        print(d[n])
//        t -= 1
//    }
//}
//// 1. define the subproblem
//// d[n][l] = the total number of pretter numbers with n digits, ends with l
//// d[1][1] = 1  // 1 digit long, ends with 1 -> 1
//// d[1][2] = 1
//// d[1][3] = 1
//// 2. guess how it ends
//// 3. recurrence
//// d[n][l] = d[n-1][l-1] + d[n-1][l+1]  where 1 <= l <= 8
//// d[n][l] = d[n-1][l+1]  where l = 0
//// d[n][l] = d[n-1][l-1]  where l = 9
//func prettyNumbers(_ n: Int) -> Int {
//    var d = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 101)
//    for i in 1...9 {
//        d[1][i] = 1
//    }
//    for i in 2...n {
//        for j in 0...9 {
//            d[i][j] = 0
//            if j >= 1 {
//                d[n][j] += d[n-1][j-1]
//            }
//            if j <= 8 {
//                d[n][j] += d[n-1][j+1]
//            }
//        }
//    }
//    var ans = 0
//    for i in 0...9 {
//        // the number of pretty numbers with n digits that end with 0...9
//        ans += d[n][i]
//    }
//    return ans
//}
//// 1. define the subproblem
//// d[n][l] = the total number of pretter numbers with n digits, ends with l
//// d[1][1] = 1  // 1 digit long, ends with 1 -> 1
//// d[1][2] = 1
//// d[1][3] = 1
//// 2. guess how it ends
//// 3. recurrence
//// d[n][l] = sum(d[n-1][k]) where 0 <= k <= l
//func nonDecreasingDigits(_ n: Int) -> Int {
//    var d = [[Int]](repeating: [Int](repeating: 0, count: 10), count: n + 1)
//    for i in 0...9 {
//        d[1][i] = 1
//    }
//    for i in 2...n {
//        for j in 0...9 {
//            for k in 0...j {
//                d[i][j] += d[i-1][k]
//            }
//        }
//    }
//    var ans = 0
//    for i in 0...9 {
//        ans += d[n][i]
//    }
//    return ans
//}
