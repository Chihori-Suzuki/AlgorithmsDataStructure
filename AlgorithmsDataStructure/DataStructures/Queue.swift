//
//  Stack.swift
//  AlgorithmsDataStructure
//
//  Created by 鈴木ちほり on 2021/03/16.
//

import Foundation

public final class Queue<E>: Sequence {
    
    private var first: Node<E>? = nil
    private(set) var count: Int = 0 //set is private
    
    fileprivate class Node<E> {
        fileprivate var item: E
        fileprivate var next: Node<E>?
        fileprivate init(item: E, next: Node<E>? = nil) {
            self.item = item  // self = Node class
            self.next = next
            
        }
    }
    
    // initializes an empty bag
    public init() {
    }
    
    /// Adds the item to this bag (front)
    /// - Parameter item: the item to add to this bag
    public func enqueue(item: E) { // without public, I can use only my library
        let oldFirst = first
        first = Node<E>(item: item ,next: oldFirst)
        count += 1
    }
    
    /// Removes the item to this bag (front)
    /// - Parameter item: the item to add to this bag
    public func dequeue() -> E? {
        guard let firstNode = first else { return nil }
        
        if firstNode.next == nil {
            let firstItem = firstNode.item
            first = nil
            return firstItem
        }

        var previous: Node<E>? = firstNode
        var current: Node<E>? = previous?.next
        while current?.next != nil {
            previous = current
            current = current!.next
        }
        let returnedItem = current!.item
        previous!.next = nil
        count -= 1
        return returnedItem
    }
    
    public func peek() -> E? {
        return first?.item
    }
    
    /// Returns true if the bag is epmtyc
    /// - Returns: true if this bag is empty, otherwise false
    public func isEmpty() -> Bool {
        return first == nil
    }
    
    public struct  QueueIterator<E> : IteratorProtocol {
        public typealias Element = E
        
        private var current: Node<E>?
        
        fileprivate init(_ first: Node<E>?) {
            self.current = first
        }
        
        public mutating func next() -> E? {
            if let item = current?.item {
                current = current?.next
                return item
            }
            return nil
        }
    }
    /// Returns an iterator that iterates over the items in this bag in reverse order
    public func makeIterator() -> QueueIterator<E> {
        return QueueIterator<E>(first)
    }
}

extension Queue: CustomStringConvertible {
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1), " }
    }
}

