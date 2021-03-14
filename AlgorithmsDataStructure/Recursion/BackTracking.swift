//
//  BackTracking.swift
//  AlgorithmsDataStructure
//
//  Created by 鈴木ちほり on 2021/03/11.
//

import Foundation

func rollDiceSum(n: Int, desiredSum: Int) {
    var choices = [Int]()
    rollDiceSumHelper(n: n, desiredSum: desiredSum, soFar: 0, choices: &choices)
}


// dice = 2
// sum = 5 [1, 4] [2, 3]...
func rollDiceSumHelper(n: Int, desiredSum: Int, soFar: Int, choices: inout [Int]) {
    if n == 0 {
        if desiredSum == soFar {
            print(choices)
        }
    } else {
        for i in 1...6 {
            // choose i, and the remaining desired sum should be between 1 * (n-1) <=   <= 6 * (n-1)
            if soFar + i + (n - 1) * 1 <= desiredSum && desiredSum <= soFar + i + (n - 1) * 6 {
                choices.append(i)
                rollDiceSumHelper(n: n - 1, desiredSum: desiredSum, soFar: soFar + i, choices: &choices)
                choices.removeLast()
            }
        }
    }
}

func rollDiceSum2(n: Int, desiredSum: Int) {
    var choices = [Int]()
    var sets = Set<Int>()
    rollDiceSumHelper2(n: n, desiredSum: desiredSum, soFar: 0, choices: &choices, &sets, desiredDev: 1)
}

// dice = 2
// sum = 5 [1, 4] [2, 3]...
func rollDiceSumHelper2(n: Int, desiredSum: Int, soFar: Int, choices: inout [Int], _ set: inout Set<Int>, desiredDev: Int) {
    if n == 0 {
        if desiredSum == soFar {
            if !(set.contains(desiredDev)) {
                set.insert(desiredDev)
                print(choices)
            }
        }
    } else {
        for i in 1...6 {
            // choose i, and the remaining desired sum should be between 1 * (n-1) <=   <= 6 * (n-1)
            if soFar + i + (n - 1) * 1 <= desiredSum && desiredSum <= soFar + i + (n - 1) * 6 {
                choices.append(i)
                rollDiceSumHelper2(n: n - 1, desiredSum: desiredSum, soFar: soFar + i, choices: &choices, &set, desiredDev: desiredDev * i)
                choices.removeLast()
            }
        }
    }
}

//func readBinaryWatch(_ num: Int) -> [String] {
//    var times = [Int]()
//    var positions = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
//    readBinaryWatchHelper(positions, num, times: &times, 0)
//    return ["a"]
//}
//backtrack(positions,remaining, outputs, start):

func readBinaryWatchHelper(_ positions: [Int],_ num: Int, times: inout [Int], start: Int) {
    let binaries = [1, 2, 4, 8, 1, 2, 4, 8, 16, 32]
    if num == 0 {
//        let strMin = String(format: "%02d", Int(min))
//        if time < 12 && min < 60 {
//            times.append("\(Int(time)):\(strMin)" )
//        }
    } else {
        for i in 0...binaries.count - 1 {
        }
    }
}

// ["0:03","0:05","0:06","0:09","0:10","0:12","0:17","0:18","0:20","0:24","0:33","0:34","0:36","0:40","0:48","1:01","1:02","1:04","1:08","1:16","1:32","2:01","2:02","2:04","2:08","2:16","2:32","3:00","4:01","4:02","4:04","4:08","4:16","4:32","5:00","6:00","8:01","8:02","8:04","8:08","8:16","8:32","9:00","10:00"]


// ["1:00", "2:00", "4:00", "8:00", "1:01", "1:02", "1:04", "1:08", "1:16", "1:32", "1:00", "2:00", "4:00", "8:00", "2:01", "2:02", "2:04", "2:08", "2:16", "2:32", "1:00", "2:00", "4:00", "8:00", "4:01", "4:02", "4:04", "4:08", "4:16", "4:32", "1:00", "2:00", "4:00", "8:00", "8:01", "8:02", "8:04", "8:08", "8:16", "8:32", "1:01", "2:01", "4:01", "8:01", "0:01", "0:02", "0:04", "0:08", "0:16", "0:32", "1:02", "2:02", "4:02", "8:02", "0:01", "0:02", "0:04", "0:08", "0:16", "0:32", "1:04", "2:04", "4:04", "8:04", "0:01", "0:02", "0:04", "0:08", "0:16", "0:32", "1:08", "2:08", "4:08", "8:08", "0:01", "0:02", "0:04", "0:08", "0:16", "0:32", "1:16", "2:16", "4:16", "8:16", "0:01", "0:02", "0:04", "0:08", "0:16", "0:32", "1:32", "2:32", "4:32", "8:32", "0:01", "0:02", "0:04", "0:08", "0:16", "0:32"]


func readBinaryWatch2(_ num: Int) -> [String] {
    var times = [String]()
    var positions = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    readBinaryWatchHelper2(num, time: 0, min: 0, times: &times)
    return times
}

func readBinaryWatchHelper2(_ num: Int, time: Int, min: Int, times: inout [String]) {
    let binaries = [1, 2, 4, 8, 1, 2, 4, 8, 16, 32]
    if num == 0 {
        let strMin = String(format: "%02d", Int(min))
        if time < 12 && min < 60 {
            times.append("\(Int(time)):\(strMin)" )
        }
    } else {
        for i in 0...binaries.count - 1 {
            
            
        }
    }
}

// i = 0
// helper([0*10], num:2, outputs:[], startPosition: 0)
// positions=[0, 0, 0, 0, 0, 0, 0, 0, 0, 0] -> [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    // i = 1 ~ 10
    // helper([1, 0, 0, 0, 0, 0, 0, 0, 0, 0], num:1, outputs:[], startPosition: 1)
    // positions=[1, 0, 0, 0, 0, 0, 0, 0, 0, 0] -> [1, 1, 0, 0, 0, 0, 0, 0, 0, 0]

        // helper([1, 1, 0, 0, 0, 0, 0, 0, 0, 0], num:0, outputs:[], startPosition: 2)
        // positions=[1, 1, 0, 0, 0, 0, 0, 0, 0, 0]
        // output -> [1, 1, 0, 0, 0, 0, 0, 0, 0, 0]

    // i = 1 ~ 10
    // positions=[1, 1, 0, 0, 0, 0, 0, 0, 0, 0] -> [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]

// ***********************
    // i = 2 ~ 10
    // positions=[1, 0, 0, 0, 0, 0, 0, 0, 0, 0] -> [1, 0, 1, 0, 0, 0, 0, 0, 0, 0]

        // helper([1, 0, 1, 0, 0, 0, 0, 0, 0, 0], num:0, outputs:[1, 1, 0, 0, 0, 0, 0, 0, 0, 0], startPosition: 2)
        // positions=[1, 1, 0, 0, 0, 0, 0, 0, 0, 0] ->
        // output -> [1, 1, 0, 0, 0, 0, 0, 0, 0, 0], [1, 0, 1, 0, 0, 0, 0, 0, 0, 0]
