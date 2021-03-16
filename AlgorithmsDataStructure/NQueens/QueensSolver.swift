//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var count = 0
var recCount = 0

func solveQueens(board: inout Board) {
    solveQueensHelper(0, &board)
    print("\(count) possible ways")
    print(recCount)
}

func solveQueensHelper(_ row: Int,_ board: inout Board) {
    recCount += 1
    if board.size == row {
        print(recCount)
        print(board)
        count += 1
        return
        
    } else {
        for c in 0...board.size - 1 {
            if board.isSafe(row: row, col: c) {
                board.place(row: row, col: c)
                solveQueensHelper(row + 1, &board)
                board.remove(row: row, col: c)
                
            }
        }
    }
}
