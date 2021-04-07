//
//  topologicalSort1.swift
//  AlgorithmsDataStructure
//
//  Created by Chiori Suzuki on 2021/04/06.
//

import Foundation

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    
    var adjList = [[Int]](repeating: [Int](), count: numCourses)
    var indegree = [Int](repeating: 0, count: numCourses)
    
    for items in prerequisites {
        let u = items[1]
        let v = items[0]
        adjList[u].append(v)
        indegree[v] += 1
    }
    
    let q = Queue<Int>()
    for i in 0..<numCourses {
        if indegree[i] == 0 {
            q.enqueue(item: i)
        }
    }
    if q.isEmpty() { return false }
    
    while !q.isEmpty() {
        let u = q.dequeue()!
        for v in adjList[u] {
            indegree[v] -= 1
            if indegree[v] == 0 {
                q.enqueue(item: v)
            }
        }
    }
    for i in indegree {
        if i != 0 {
            return false
        }
    }
    return true
}
