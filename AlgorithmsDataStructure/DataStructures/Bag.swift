//
//  Bag.swift
//  AlgorithmsDataStructure
//
//  Created by 鈴木ちほり on 2021/03/15.
//

import Foundation

public final class Bag<E> {
    
    private var first: Node<E>? = nil
    private(set) var count: Int = 0
    
    fileprivate class Node<E> {
        fileprivate var item: E
        fileprivate var next: Node<E>?
        fileprivate init(item: E, next: Node<E>? = nil) {
            self.item = item  // self = Node class
            self.next = next
            
        }
        
    }
    
    public init() {
    }
    
    public func add(item: E) {
//        let oldFront = first
//        first = Node<E>(item: item ,next: oldFirst)
        
        
    }
    
    public func isEmpty() -> Bool {
        return first == nil
    }
    
}

