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

//var count = 0
func solveQueens(board: inout Board) {
//	count += 1
    var choices = [Int]()
    let size = board.size
    solveQueensHelper(2, size, &board, choices: &choices)
}

func solveQueensHelper(_ n: Int, _ size: Int,_ board: inout Board, choices: inout [Int]) {
    if n == 0 {
        print(choices)
        board.place(row: choices[0], col: choices[1])
//        print(board)
        board.remove(row: choices[0], col: choices[1])
        choices.removeLast()
        return
        
    } else {
        for i in 0...size - 1 {
            choices.append(i)
            solveQueensHelper(n - 1, size, &board, choices: &choices)
        }
        
        choices.removeAll()
    }
}

