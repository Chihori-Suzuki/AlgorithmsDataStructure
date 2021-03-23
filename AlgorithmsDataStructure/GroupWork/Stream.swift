//
//  StringStream.swift
//  AlgorithmsDataStructure
//
//  Created by 鈴木ちほり on 2021/03/18.
//

import Foundation

func stream(_ comparator: (Int, Int) -> Bool) {
    
//    let arr = [6, 61, 10, 24, 9, 1625, 2, 30]
    let arr = [2, 3, 1, 7, 9 ,8]
    let m = 5
    var collection: [Int] = []
    
    for i in arr {
        
        if collection.isEmpty {
            collection.append(i)
            continue
        }
        if collection.count == m && comparator(collection[m-1], i) {
            continue
        }
        let n = streamHelper(i, collection, comparator)
        
        if collection.count == m {
            collection.removeLast()
        }
        collection.insert(i, at: n)
    }
    print(collection)
}

func streamHelper(_ target: Int, _ collection: [Int], _ comparator: (Int, Int) -> Bool) -> Int {
    
    let arr = collection
    var high = arr.count - 1
    var low = 0
    var mid = 0
    
    while low <= high {
        mid = (low + high) / 2
        if arr[mid] == arr[high] {
//            if arr[mid] == arr[high] {
            if comparator(arr[mid], target) {
                mid += 1
                break
            } else {
                break
            }

        } else if comparator(target,arr[mid]) {
            high = mid - 1
        } else {
            low = mid + 1
        }
        
    }
    return mid
}

//func streamHelper1<T: Comparable>(_ arr: inout [T], _ pickArr: inout [T], _ comparator: (T, T) -> Bool, _ n: Int)  {
//
//    if n == arr.count {
//        print(pickArr)
//    } else {
//        for i in 0..<pickArr.count {
////            print(element)
//            if comparator(arr[i], arr[n]) { // if i < arr[n], swich
//                pickArr[i] = arr[n]
//                let temp = arr[i]
//                arr[i] = arr[n]
//                arr[n] = temp
//            }
//            streamHelper(&arr, &pickArr, <, n + 1)
//        }
//    }
//
//}
