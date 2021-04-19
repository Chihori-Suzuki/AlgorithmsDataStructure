//
//  NetworkDelayTime.swift
//  AlgorithmsDataStructure
//
//  Created by Chiori Suzuki on 2021/04/17.
//

import Foundation

func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {

    var adj = [[CompEdge]](repeating: [], count: n + 1)
    
    for time in times {
        adj[time[0]].append(CompEdge(v: time[1], w: time[2]))
    }
    let max = Int.max
    var dist = [Int](repeating: max, count: n + 1)
    dist[k] = 0
    dist[0] = 0
    var pq = IndexPriorityQueue<CompEdge>(<)
    
    for edge in adj[k] {
        pq.enqueue(CompEdge(v: edge.v, w: edge.w))
    }
    
    while let edge = pq.dequeue() {
        if edge.w < dist[edge.v] {
            dist[edge.v] = edge.w
            for e in adj[edge.v] {
                pq.enqueue(CompEdge(v: e.v, w: e.w + edge.w))
            }
        }
    }
    
    return dist.contains(max) ?  -1 : dist.max()!
}


