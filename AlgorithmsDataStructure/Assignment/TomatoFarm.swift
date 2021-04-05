//
//  TomatoFarm.swift
//  AlgorithmsDataStructure
//
//  Created by Chiori Suzuki on 2021/04/02.
//

import Foundation

func tomatoFarm() {
    
    struct Square {
        let x: Int
        let y: Int
    }
    
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    let mn = readLine()!.split(separator: " ").map { Int($0)! }
    let m = mn[0]
    let n = mn[1]
    
    var farm = [[Int]]()
    
    for _ in 0..<n {
        let row =  readLine()!.split(separator: " ").map { Int(String($0))! }
        farm.append(row)
    }
    
    var ripedFarm = farm
    var day = 0
    
    func bfs(_ targets: [Square]){
        
        let q = Queue<[Square]>()
        q.enqueue(item: targets)
        
        while !q.isEmpty() {
            var squareArr = [Square]()
            
            let sq = q.dequeue()!
            for target in sq {
                let x = target.x
                let y = target.y
                for i in 0..<4 {
                    let nx = x + dx[i]
                    let ny = y + dy[i]
                    if nx >= 0 && nx < n && ny >= 0 && ny < m {
                        if (farm[nx][ny] == 0 && ripedFarm[nx][ny] == 0) {
                            //                            q.enqueue(item: Square(x: nx, y: ny))
                            squareArr.append(Square(x: nx, y: ny))
                            ripedFarm[nx][ny] = 1
                        }
                    }
                }
            }
            
            if !squareArr.isEmpty {
                q.enqueue(item: squareArr)
                day = day + 1
            }
        }
        
    }
    
    var targetArr = [Square]()
    
    for x in 0..<n {
        for y in 0..<m {
            if farm[x][y] == 1 {
                targetArr.append(Square(x: x, y: y))
            }
        }
    }
    
    bfs(targetArr)
    
    for x in 0..<n {
        for y in 0..<m {
            if ripedFarm[x][y] == 0 {
                day = -1
                break
            }
        }
    }
    print(day)
}
