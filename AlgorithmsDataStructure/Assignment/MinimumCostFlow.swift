//
//  MinimumCostFlow.swift
//  AlgorithmsDataStructure
//
//  Created by Chiori Suzuki on 2021/04/14.
//

import Foundation

public func MCF() -> Int {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    var allEdges = [(u: Int, v: Int, w: Int, x: Bool)]()
    var mstEdges = [(u: Int, v: Int, w: Int, x: Bool)]()
    
    var noShortEdges = [(u: Int, v: Int, w: Int, x: Bool)]()
    
    for i in 1...input[0] {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        if i <= input[0] - 1 {
            allEdges.append((u: line[0], v: line[1], w: line[2], x: true))
        } else {
            allEdges.append((u: line[0], v: line[1], w: line[2], x: false))
        }
    }
    
    allEdges.sort { $0.w < $1.w }
    
    var uf = UF(allEdges.count+1)
    for edge in allEdges {
        if uf.connected(edge.u, edge.v) {
            // not shortest pass
            noShortEdges.append(edge)
            continue
        }
        uf.union(edge.u, edge.v)
        mstEdges.append(edge)
    }
    
    var inactiveCont = mstEdges.filter({$3 == false}).count  // inactive count in the shortest pass
    
    if mstEdges.last!.x  {
        return inactiveCont
    }
    
    for noEdge in noShortEdges.reversed() {
        if noEdge.x && (noEdge.w - input[2]) == 0 {
            inactiveCont -= 1 // reduce the day to activeate the pipes
            break
        }
    }
    
    return inactiveCont
}


