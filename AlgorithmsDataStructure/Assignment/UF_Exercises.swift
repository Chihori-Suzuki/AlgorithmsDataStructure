//
//  UF_Exercises.swift
//  AlgorithmsDataStructure
//
//  Created by Chiori Suzuki on 2021/04/07.
//

import Foundation


func findCircleNum(_ isConnected: [[Int]]) -> Int {
    var id = [Int](repeating: 0, count: isConnected.count)
    
    for i in 0..<isConnected.count {  // set id of each object to itself
        id[i] = i
    }
    
    for i in 0..<isConnected.count {
        for j in 0..<isConnected.count {
            if isConnected[i][j] == 1 { id[j] = i }
        }
    }
    let count = Array(Set(id))
    
    return count.count
}
