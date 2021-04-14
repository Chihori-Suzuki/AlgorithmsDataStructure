//
//  SushiRestaurant.swift
//  AlgorithmsDataStructure
//
//  Created by Chiori Suzuki on 2021/03/31.
//

import Foundation

func sushiReviews() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0]
    let m = nm[1] // number of target
    var adjList = [[Int]](repeating: [], count: n)
    var check = [Bool](repeating: false, count: n)
    var depth = [Int](repeating: 0, count: n)
    var parentArr = [Int](repeating: 0, count: n)
    
    let targets = readLine()!.split(separator: " ").map { Int($0)! }
    
    for _ in 0..<n-1 {
        let edge = readLine()!.split(separator: " ").map { Int($0)! }
        let u = edge[0]
        let v = edge[1]
        adjList[u].append(v)
        adjList[v].append(u)
    }
    var newList = adjList
    var targetCount = [Int](repeating: 0, count: n)
    targetCount[0] = m
    
    // delete needless nodes
    func delNodes(_ adjList: [[Int]], _ parent: Int ) {
        check[parent] = true
        for edge in adjList[parent] {
            if !check[edge] {
                for t in targets {
                    if t == edge {
                        targetCount[parent] = targetCount[edge] + 1
//                        targetCount[edge] = targetCount[edge] + 1
                    }
                }
                parentArr[edge] = parent
                delNodes(adjList, edge)
            }
        }
    }
    
    delNodes(adjList, 0)
    
    for target in 1..<targetCount.count-1 {
        let parent = parentArr[target]
        for t in targets {
            targetCount[t] = targetCount[t] + 1
        }
        if targetCount[target] == 0 {
//            for i in targetCount[parent] {
//
//            }
            newList.remove(at: target)
        }
    }
    
    print(targetCount)
    print(parentArr)
    print(newList)
    
    
}

