//
//  main.swift
//  AlgorithmsDataStructure
//
//  Created by 鈴木ちほり on 2021/03/09.
//

import Foundation

//print(power(base: 2, exponent: 3))

//print(revertseLines(13))

//print(evaluate("(1+4)*1+(3+2)"))
//print(evaluate("((1+4)+(1+(5*2)))"))

//permutation("riiq")
//permutationUnique("park", "", )

//rollDiceSum2(n: 3, desiredSum: 5)
//print("***************************")
//rollDiceSum(n: 3, desiredSum: 5)

//print(readBinaryWatch(2))

//var arr = [1,8,3,5,6,4,9,7]
//var start = arr.startIndex
//var end = arr.count - 1
//print(quickSort(&arr, &start, &end))

//crawl()
//printBinaryExhaustive(3)
//getFileList("/Users/suzukichihori/Cornerstone/WMAD/Swift_Algorithms&DataStructures/AlgorithmsDataStructure/AlgorithmsDataStructure/main.swift")
//var board = Board(size: 8)
//solveQueens(board: &board)

//let stack = Stack<Int>()
//stack.push(item: 10)
//stack.push(item: 9)
//stack.push(item: 8)
//print(stack.pop())
//print(stack.description)
//
//for item in stack {
//    print(item)
//}

//let queue = Queue<Int>()
//queue.enqueue(item: 10)
////queue.enqueue(item: 9)
//queue.enqueue(item: 8)
//print(queue.dequeue())
//print(queue.description)
//
//for item in queue {
//    print(item)
//}

//var arr = [3,1,4,2,6,5]
//stream(arr, 2)

//findParent()

//stream(<)

//findParent()
//test()

//diameter()


//whosMyParent()

//lca()
//adjacencyListDFS()

//cycle()

//repeatingSequence()

//diameterMain()

//tomatoFarm()

//sushiReviews()

//print(canFinish(2, [[1,0]]))
//print(findOrder(4, [[1,0],[2,0],[3,1],[3,2]]))

//print(findCircleNum([[1,0,0],[0,1,0],[0,0,1]]))

//let costs = [[10, 20], [30, 200], [400, 50], [30, 20]]
//print(twoCitySchedCost(costs))

//print(canCompleteCircuit([2,3,4], [3,4,3]))

//print(partitionLabels1("ababcbacadefegdehijhklij"))

//print(MCF())

//print(networkDelayTime([[2,1,1],[2,3,1],[3,4,1]], 4, 2))

//print(findCheapestPrice(3, [[0,1,100],[1,2,100],[0,2,500]], 0, 2, 0))

let fileManagers = FileManager.default
let filePath = "/Users/suzukichihori/Cornerstone/WMAD/Swift_Algorithms&DataStructures/AlgorithmsDataStructure/AlgorithmsDataStructure/Assignment/mcf"
let contens = try! fileManagers.contentsOfDirectory(atPath: filePath)
for file in contens.sorted() {
    if !file.contains(".in") { continue }
    print(filePath + "/" + file)
    print(MCF(true, filePath + "/" + file))
}
