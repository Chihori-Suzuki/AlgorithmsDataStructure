//
//  Diameter.swift
//  AlgorithmsDataStructure
//
//  Created by 鈴木ちほり on 2021/03/21.
//

import Foundation

func diameterMain() {
    let n = Int(readLine()!)!
    var adjList = [[(v: Int, w: Int)]](repeating: [], count: n + 1)
    
    for _ in 0..<n {
        let line = readLine()!.split(separator: " ").map { Int($0) }
        var i = 1
        while line[i] != -1 {
            adjList[line[0]!].append((line[i]!, line[i+1]!))
            i += 2
        }
    }
    
    
    func bfs(node: Int, tree: [[(v: Int, w: Int)]], distance: inout [Int], check: inout [Bool]) {
        let q = Queue<Int>()
        q.enqueue(item: node)
        check[node] = true
        
        while !q.isEmpty() {
            let x = q.dequeue()!
            for child in adjList[x] {
                if !check[child.v] {
                    distance[child.v] = distance[x] + child.w
                    check[child.v] = true
                    q.enqueue(item: child.v)
                }
            }
        }
    }
    
    var check = [Bool](repeating: false, count: n + 1)
    var distance = [Int](repeating: 0, count: n + 1)
    
    let startNode = 1
    bfs(node: startNode, tree: adjList, distance: &distance, check: &check)
    
    var check2 = [Bool](repeating: false, count: n + 1)
    var distance2 = [Int](repeating: 0, count: n + 1)
    var maxIndex = 1
    
    for i in 2..<distance.count {
        if distance[i] > distance[maxIndex] {
            maxIndex = i
        }
    }
    bfs(node: maxIndex, tree: adjList, distance: &distance2, check: &check2)
    
    print(distance2.max()!)
    
}


