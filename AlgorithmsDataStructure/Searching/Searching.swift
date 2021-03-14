//
//  Searching.swift
//  AlgorithmsDataStructure
//
//  Created by 鈴木ちほり on 2021/03/12.
//

import Foundation

/// leniar search
/// - Parameters:
///   - collection: an array of equatable objects
///   - target: the target
/// - Returns: the index of the given
func linearSearch<T: Equatable>(_ collection: [T], _ target: T) -> Int? { //
    for (index, element ) in collection.enumerated() where element == target {
        return index
    }
    return nil
}

/// Binary Search
/// Ore-condition: elements in the collection MUST be sorted.
/// - Parameters:
///   - collection: an array of comparable object
///   - target: the target
/// - Returns: the index
func binarySearch<T: Comparable>(_ collection: [T], _ target: T) -> Int? {
    var lower = 0
    var upper = collection.count - 1 // searching range
    
    while lower <= upper {
        let mid = (lower + upper) / 2
        if collection[mid] == target {
            return mid
        } else if collection[mid] < target {
            lower = mid + 1
        } else {
            upper = mid - 1
        }
    }
    return nil
}

