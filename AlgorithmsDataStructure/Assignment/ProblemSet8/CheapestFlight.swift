//
//  CheapestFlight.swift
//  AlgorithmsDataStructure
//
//  Created by Chiori Suzuki on 2021/04/18.
//

import Foundation
func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
    struct Edge {
        let to: Int
        let weight: Int
    }
    let max = 10000
    var adj = [[Edge]](repeating: [], count: n)
    var dist = [Int](repeating: max, count: n)
    var check = [Bool](repeating: false, count: n)
    var route = [Int](repeating: 0, count: n)
    
    dist[src] = 0
    check[src] = true
    route[src] = 0
    
    for edge in flights {
        adj[edge[0]].append(Edge(to: edge[1], weight: edge[2]))
    }
    
    for _ in 0..<n {
        var min = max
        var minVertex = 0
        for v in 0..<n {
            if !check[v] && dist[v] < min {
                min = dist[v]
                minVertex = v
            }
        }
        
        check[minVertex] = true
        for edge in adj[minVertex] {
            let to = edge.to
            if dist[to] > dist[minVertex] + edge.weight && route[to] - K < 1 {
                dist[to] = dist[minVertex] + edge.weight
                route[to] += 1
            }
        }
    }
    
    return dist[dst]
//    return route[dst] = route[dst] - K <= 1 ? dist[dst] :
}


