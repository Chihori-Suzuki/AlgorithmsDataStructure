//
//  MinimumCostFlow.swift
//  AlgorithmsDataStructure
//
//  Created by Chiori Suzuki on 2021/04/14.
//

import Foundation

public func MCF(_ testMode: Bool = false,_ filePath: String = "") -> Int {
    
    var allEdges = [(u: Int, v: Int, w: Int, x: Bool)]()
    var mstEdges = [(u: Int, v: Int, w: Int, x: Bool)]()
    var buildings = 0
    var pipes = 0
    var enhancerStrength = 0
    var graph =  [[(u: Int, v: Int, w: Int, x: Bool)]]()
    
    if testMode {
        (graph, buildings, pipes, enhancerStrength) = getTestInput(from: filePath)
        
    } else {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        buildings = input[0]
        pipes = input[1]
        enhancerStrength = input[2]
        graph = [[(u: Int, v: Int, w: Int, x: Bool)]](repeating: [(u: Int, v: Int, w: Int, x: Bool)](), count: buildings + 1)
        for i in 0..<pipes {
            let inputEdge = readLine()!.split(separator: " ").map { Int($0)! }
            let u = inputEdge[0]
            let v = inputEdge[1]
            let w = inputEdge[2]
            graph[u].append((u: u, v: v, w: w, x: i < buildings - 1))
        }
    }
    
    var noShortEdges = [(u: Int, v: Int, w: Int, x: Bool)]()
    
    for g in graph {
        //        let line = readLine()!.split(separator: " ").map { Int($0)! }
        for n in g {
            allEdges.append(n)
        }
    }
    
    allEdges.sort { $0.w < $1.w }
    
//    for i in allEdges { print(i) }
//    print()
    var uf = UnionFindMCF(allEdges.count + 1)
    for edge in allEdges {
        if uf.connected(edge.u, edge.v) {
            // not shortest pass
            noShortEdges.append(edge)
            continue
        }
        uf.union(edge.u, edge.v)
        mstEdges.append(edge)
    }
//    for i in mstEdges { print(i) }
    
    var inactiveCont = mstEdges.filter({$3 == false}).count  // inactive count in the shortest pass
    
    if mstEdges.last!.x  {
        return inactiveCont
    }
    
    for noEdge in noShortEdges.reversed() {
        if noEdge.x && (noEdge.w - enhancerStrength) == 0 {
            inactiveCont -= 1 // reduce the day to activeate the pipes
            break
        }
    }
    
    return inactiveCont
}


fileprivate struct UnionFindMCF {
    /// parent[i] = parent of i
    private var parent: [Int]
    /// size[i] = number of nodes in tree rooted at i
    private var size: [Int]
    /// number of components
    private(set) var count: Int
    
    /// Initializes an empty union-find data structure with **n** elements
    /// **0** through **n-1**.
    /// Initially, each elements is in its own set.
    /// - Parameter n: the number of elements
    public init(_ n: Int) {
        self.count = n
        self.size = [Int](repeating: 1, count: n + 1)
        self.parent = [Int](repeating: 0, count: n + 1)
        for i in 0..<n {
            self.parent[i] = i
        }
    }
    /// Returns the canonical element(root) of the set containing element `p`.
    /// - Parameter p: an element
    /// - Returns: the canonical element of the set containing `p`
    public mutating func find(_ p: Int) -> Int {
        // TODO
        var root = p
        while root != parent[root] {
            root = parent[root]
        }
        var p = p
        while p != parent[p] {
            let new = parent[p]
            parent[p] = root
            p = new
        }
        return root
    }
    
    /// Returns `true` if the two elements are in the same set.
    /// - Parameters:
    ///   - p: one elememt
    ///   - q: the other element
    /// - Returns: `true` if `p` and `q` are in the same set; `false` otherwise
    public mutating func connected(_ p: Int, _ q: Int) -> Bool {
        // TODO
        return find(p) == find(q)
    }
    
    /// Merges the set containing element `p` with the set containing
    /// element `q`
    /// - Parameters:
    ///   - p: one element
    ///   - q: the other element
    public mutating func union(_ p: Int, _ q: Int) {
        // TODO
        let i = find(p)
        let j = find(q)
        guard i != j else { return }
        
        if size[i] < size[j] {
            parent[i] = j
            size[j] += size[i]
        } else {
            parent[j] = i
            size[i] += size[j]
        }
        
    }
}



/// get input from given test cases
/// - Parameter filePath: file path of test cases
/// - Returns: graph and a number of buildings, pipes, and enhancerStrength
fileprivate func getTestInput(from filePath: String) -> ([[(u: Int, v: Int, w: Int, x: Bool)]], Int, Int, Int) {
    let contents = try! String(contentsOfFile: filePath, encoding: .utf8)
    let lines = contents.split(separator: "\n")
    let firstLine = lines[0].split(separator: " ").map { Int($0)! }
    let buildings = firstLine[0]
    let pipes = firstLine[1]
    let enhancerStrength = firstLine[2]
    var graph = [[(u: Int, v: Int, w: Int, x: Bool)]](repeating: [(u: Int, v: Int, w: Int, x: Bool)](), count: buildings + 1)
    for i in 1 ..< lines.count {
        let input = lines[i].split(separator: " ").map { Int($0)! }
        let u = input[0]
        let v = input[1]
        let cost = input[2]
        graph[u].append((u: u, v: v, w: cost, x: i < buildings))
    }
    return (graph, buildings, pipes, enhancerStrength)
}

/// print result
/// - Parameters:
///   - filePath: file path of test cases
///   - days: output
///   - start: start time for calculate performance
///   - testMode: true: test mode, false: user input
fileprivate func printResult(filePath: String, days: Int, start: Date, testMode: Bool) {
    let elapsed = Date().timeIntervalSince(start)
    if testMode {
        var filePath = filePath[0, filePath.count - 2]
        filePath += "out"
        let contents = try! String(contentsOfFile: filePath, encoding: .utf8)
        let output = Int(contents.split(separator: "\n")[0])!
        let fileName = filePath[filePath.lastIndex(of: "/")!...]
        print("\(fileName): \(output == days ?  "pass": "failed") \(elapsed)")
    } else {
        print(days)
    }
}


