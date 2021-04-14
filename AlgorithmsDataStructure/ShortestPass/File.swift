//
//  File.swift
//  AlgorithmsDataStructure
//
//  Created by Chiori Suzuki on 2021/04/13.
//

import Foundation


func bellmanFord(_ edges: [(u: Int, v: Int, w: Int)], _ n: Int, _ src: Int) -> [Int64] {
  var dist = [Int64](repeating: Int64(Int.max), count: n + 1) // 1-indexed
  dist[src] = 0
  
  // N - 1 times
  for _ in 0..<n-1 {
    // relax all edges
    for edge in edges {
      if dist[edge.v] > dist[edge.u] + Int64(edge.w) {
        dist[edge.v] = dist[edge.u] + Int64(edge.w)
      }
      
    }
  }
  
  return dist
}

