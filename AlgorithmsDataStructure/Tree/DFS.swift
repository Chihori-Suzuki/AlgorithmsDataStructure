//
//  DFS.swift
//  AlgorithmsDataStructures
//
//  Created by Derrick Park on 2021-03-23.
//

import Foundation

func adjacencyListDFS() {
  let firstLine = readLine()!.split(separator: " ")
  let n = Int(firstLine[0])!
  let m = Int(firstLine[1])!
  
  var adjList = [[Int]](repeating: [], count: n + 1)
  
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ")
    let u = Int(edge[0])!
    let v = Int(edge[1])!
    
    adjList[u].append(v)
    adjList[v].append(u)
  }
  
    print(adjList)
  
  func dfs(vertex: Int, adjList: [[Int]], visited: inout [Bool]) {
    visited[vertex] = true
    print(vertex)
    for v in adjList[vertex] {
      if !visited[v] {
        dfs(vertex: v, adjList: adjList, visited: &visited)
      }
    }
  }
  
  var visited = [Bool](repeating: false, count: n + 1)
  dfs(vertex: 1, adjList: adjList, visited: &visited)
    
}

//6 8
//1 2
//1 5
//2 3
//2 4
//2 5
//5 4
//4 3
//4 6
