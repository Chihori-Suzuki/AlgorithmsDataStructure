//
//  File.swift
//  AlgorithmsDataStructure
//
//  Created by 鈴木ちほり on 2021/03/19.
//

import Foundation

func findParent() {
    let n = Int(readLine()!)!
    var tree = [Int](repeating: 0, count: n)
    tree[0] = 1
//    findParentHelper(1, n, &tree)
    
    for _ in 0..<n {
        let nodeInfo = readLine()!.split(separator: " ").map { Int($0) }
        if tree[nodeInfo[0]! - 1] == 0 {
            tree[nodeInfo[0]! - 1] = nodeInfo[1]!
        }
        if tree[nodeInfo[1]! - 1] == 0 {
            tree[nodeInfo[1]! - 1] = nodeInfo[0]!
        }
        print(tree)
        
    }
    
    
}

//func findParentHelper(_ node: Int, _ n: Int, _ tree: inout [Int]) {
//    var treeArr = tree
//    var nodeVal = node
//
//    if n == 0 {
//        print(treeArr)
//        return
//    }
//
//    for _ in 0..<n - 1 {
//        let nodeInfo = readLine()!.split(separator: " ").map { Int($0) } // nodeInfo = [1, 6]
//        if nodeInfo.contains(node) {                                     // if '1' is include in nodeInfo (node is '1')
//            for i in 0..<nodeInfo.count {                               // only 2 times loop
//                if nodeInfo[i] != node {                                 // if nodeInfo[0] or nodeInfo[1] is not '1'
//                    nodeVal = nodeInfo[i]! // nodeVal = nodeInfo[0] or nodeInfo[1] (ex '6')
//                    treeArr[nodeVal] = node // add tree[6] = '1'
//                }
//            }
//        }
//        findParentHelper(nodeVal, n - 1, &treeArr)
//    }
//
//    /*
//     1 6
//     6 3
//     3 5
//     4 1
//     2 4
//     4 7
//     */
//}


/*
func mainTest() {
    let n = Int(readLine()!)!
    var nodeInfo = [[Int]](repeating: [Int]() , count: n)

    for _ in 0..<n {
        let node = readLine()!.split(separator: " ").map { Int($0)! } // nodeInfo = [1, 6]
        nodeInfo.append(node)
    }

    var nodes = [[Int]](repeating: [Int]() , count: n)
    for node in nodeInfo {
        if node.contains(1) {
            let index = node.reduce(0) { $0 + $1 } - 1
            nodes[0].append(index)
            continue
        }

        mainTestHelper(node: nodes[0], nodes: &nodes)
    }

//    test(tree: tree)


}

func mainTestHelper(node: [Int], nodes: inout [[Int]]) {
    if nodes.isEmpty { return }

    for eachNode in node {
        mainTestHelper(node: nodes[eachNode - 1], nodes: &nodes)
        mainTestHelper(node: nodes[eachNode - 1], nodes: &nodes)
        nodes[eachNode - 1].append(3)
    }
}

func test(tree: [[Int]]) {
    var parents = [Int](repeating: 0, count: 7)
//    let tree = [[6, 4], [], [5], [2, 7], [], [3], []]

    testHelper(&parents, tree: tree, nodeInfo: tree[0], parentNode: 1)
    print(parents)
}

func testHelper(_ parents: inout [Int], tree: [[Int]], nodeInfo : [Int], parentNode: Int) {
    if nodeInfo.isEmpty { return }

    for node in nodeInfo {
        testHelper(&parents, tree: tree, nodeInfo: tree[node -  1], parentNode: node)
        parents[node - 1] = parentNode
    }
}
*/

////func testfunc() {
////    let arr = [10, 9, 8, 7]
////
////    for (i, num) in arr.enumerated() {
////        print(i, num)
////    }
////}

/*
 
 1 6
 [6], [], [6], [], [], [1, 3], []
 */

