//
//  Greedy.swift
//  AlgorithmsDataStructure
//
//  Created by Chiori Suzuki on 2021/04/08.
//

import Foundation

func twoCitySchedCost(_ costs: [[Int]]) -> Int {
    var minCost = 0
    
    let sortedCosts = costs.sorted(by: { first, next in first[0] - first[1] < next[0] - next[1] })

    for i in 0..<sortedCosts.count/2 {
        minCost += sortedCosts[i][0]
    }
    for i in sortedCosts.count/2..<sortedCosts.count {
        minCost += sortedCosts[i][1]
    }
    
    return minCost
    
}

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    let n = gas.count
    var tank = 0
    var start = 0
    var total = 0
    
    for i in 0..<n {
        total += gas[i] - cost[i]
    }
     if total < 0 {
        return -1
    }
    
    for i in 0..<n {
        tank = gas[i] - cost[i]
        if tank < 0 {
            start += 1
            tank = 0
        }
    }
    if start == n { start = -1 }
    return start
}

func partitionLabels(_ S: String) -> [Int] {
    var mapchar = [Character: Int]()
    let chars = Array(S)
    for i in 0..<chars.count {
        mapchar[chars[i]] = i
    }
    var curEnd = 0, curStart = 0
    var ans = [Int]()
    while curStart<chars.count {
        curEnd = mapchar[chars[curStart]]!
        var j = curStart
        while j < curEnd {
            let end = mapchar[chars[j]]!
            if end > curEnd {curEnd = end}
            j += 1
        }
        ans.append(curEnd+1-curStart)
        curStart = curEnd+1
    }
    return ans
}


