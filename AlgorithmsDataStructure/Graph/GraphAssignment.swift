//
//  GraphAssignment.swift
//  AlgorithmsDataStructure
//
//  Created by 鈴木ちほり on 2021/03/24.
//

import Foundation

func cycle() {
    let n = Int(readLine()!)!
    
    func dfs(vertex: Int, adjList: [[Int]], visited: inout [Bool]) {
      visited[vertex] = true
      for v in adjList[vertex] {
        if !visited[v] {
          dfs(vertex: v, adjList: adjList, visited: &visited)
        }
      }
    }
    for _ in 0..<n {
        let m = Int(readLine()!)!
        var adjList = [[Int]](repeating: [], count: m + 1)
        let edges = readLine()!.split(separator: " ")
        for i in 0..<m {
            let u = i + 1
            let v = Int(edges[i])!
            adjList[u].append(v)
            adjList[v].append(u)
        }
        var visited = [Bool](repeating: false, count: m + 1)
        var count = 0
        for v in 1...m {
          if !visited[v] {
            dfs(vertex: v, adjList: adjList, visited: &visited)
            count += 1
          }
        }
        print(count)
    }

}

func repeatingSequence() {
    let input = readLine()!.split(separator: " ")
    var digit = Int(input[0])!
    let n = Int(input[1])!
    var answers: [Int] = []
    repeatingSequenceHelper(&digit, n, &answers)
    
}


func repeatingSequenceHelper(_ digit: inout Int, _ n: Int,_ answers: inout [Int]) {
    
    if answers.contains(digit) {
        print(answers.firstIndex(of: digit)!)
        return
    }
    var sum = 0
    var l = digit
    var r = digit
    var ans: NSDecimalNumber
    var ansInt: Int
    
    while l != 0 {
        r = l % 10
        l = l / 10
        ans = NSDecimalNumber(decimal: pow(Decimal(r), n))
        ansInt = Int(truncating: ans)
        sum += ansInt
    }
    
    answers.append(digit)
    
    repeatingSequenceHelper(&sum, n, &answers)
}


