//
//  Diameter.swift
//  AlgorithmsDataStructure
//
//  Created by 鈴木ちほり on 2021/03/21.
//

import Foundation

func diameter() {
    let mainTree = [ 1: [3: 2],
                     2: [4: 4],
                     3: [1: 2, 4: 3],
                     4: [2: 4, 3: 3, 5: 6],
                     5: [4: 6]
                    ]
    var distance: [Int] = []
    var visited: [Int] = []
    var disVal = 0
    
    diameterHelper(mainTree, &distance, &visited, &disVal)
}



func diameterHelper(_ tree: [Int: [Int: Int]] , _ distance : inout [Int], _ visited : inout [Int], _ distanceValue : inout Int) {
    
    
    for i in tree {
        visited.append(i.key) // first node append
        
        
        
        for j in tree[i.key]! {   // i.key ---> 1 to 5
            if visited.contains(j.key) {
                return
            }
            visited.append(j.key)
            distanceValue += tree[i.key]![j.key]!  // [4: [2: << 4 >>] , ... ]]
            distance.append(distanceValue)
            diameterHelper(tree, &distance, &visited, &distanceValue)
            
            print(distanceValue)
        }
        
        
        
    }
}
