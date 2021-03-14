//
//  Sorting.swift
//  AlgorithmsDataStructure
//
//  Created by 鈴木ちほり on 2021/03/12.
//

import Foundation

// Fastest sorting algorthim so far: O(Nlg N)

// 1. Bubble Sort - O(N^2) // fastest case
func bubbleSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
    guard arr.count > 1 else { return arr }
    var elements = arr
    for i in 0..<elements.count - 1 {
        for j in 1..<elements.count - 1  {
            if comparator(elements[j], elements[j-1]) {
                let temp = elements[j-1]
                elements[j-1] = elements[j]
                elements[j] = temp
                
            }
            
        }
    }
    return elements
}

// 2. Selection Sort - O(N^2)
func selectionSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
    guard arr.count > 1 else { return arr }
    var elements = arr
    for i in 0..<elements.count - 1 {
        var indexMin = i
        for j in i+1..<elements.count {
            if comparator(elements[j], elements[indexMin]) {
                indexMin = j
            }
        }
        if i != indexMin {
            elements.swapAt(indexMin, i)
        }
    }
    return elements
}

// 3. Insertion Sort - O(N^2)
func insertionSor<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
    guard arr.count > 1 else { return arr }
    var elements = arr
    for i in 1..<elements.count {
        var j = i
        let elemToInsert = elements[i]
        while j > 0 && comparator(elemToInsert, elements[j - 1]) {
            elements[j] = elements[j - 1]
            j -= 1
            
        }
        elements[j] = elemToInsert
    }
    return elements
}
    

// 4. Merge sort - O(Nlg N)
func mergeSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
    guard arr.count > 1 else { return arr }
    
    let mid = arr.count / 2
    // 0 - mid
    let sortedLeft = mergeSort(Array(arr[..<mid]), comparator) //arr[]: its just string, view. we need to convert to Array
    let srtedRight = mergeSort(Array(arr[mid...]), comparator)
    return merge(sortedLeft, srtedRight, comparator)
    
}

func merge<T: Comparable>(_ left: [T], _ right: [T], _ comparator: (T,T) -> Bool) -> [T] {
    var i = 0
    var j = 0
    var merged: [T] = []
    while true {
        guard i < left.count else {
            merged.append(contentsOf: right[j...])
            break
        }
        guard i < right.count else {
            merged.append(contentsOf: left[j...])
            break
        }
        if comparator(left[i], right[j]) {
            merged.append(left[i])
            i += 1
        } else {
            merged.append(right[j])
            j += 1
        }
        
    }
    return merged
}


// 5. Quick Sort (Assignment) - O(Nlg N)

func quickSort<T: Comparable>(_ arr: inout [T], _ start: inout Int, _ end: inout Int) -> [T] {
    
    if start >= end { return arr }
    var endIndex = pertition(&arr, &start, &end) - 1
    var startIndex = pertition(&arr, &start, &end) + 1
    _ = quickSort(&arr, &start, &endIndex)
    _ = quickSort(&arr, &startIndex, &end)
    return arr
}

func pertition<T: Comparable>(_ arr: inout [T], _ start: inout Int, _ end: inout Int) -> Int {
    
    var pIndex = start
    
    for i in start...end - 1 {
        if arr[i] <= arr[end] {
            // swap arr[start] , arr[i]
            arr.swapAt(pIndex, i)
            pIndex += 1
        }
    }
    // swap arr[start](pIndex), pivot
    arr.swapAt(pIndex, end)
    
    return pIndex
}


// 6. Heap Sort(later) - O(Nlg N)


