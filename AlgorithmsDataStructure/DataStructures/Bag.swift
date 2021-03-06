//
//  Bag.swift
//  AlgorithmsDataStructure
//
//  Created by 鈴木ちほり on 2021/03/15.
//

import Foundation

public final class Bag<E>: Sequence {
    
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
    public func add(item: E) { // without public, I can use only my library
        let oldFrirst = first
        first = Node<E>(item: item ,next: oldFrirst)
        count += 1
        
    }
    
    /// Returns true if the bag is epmty
    /// - Returns: true if this bag is empty, otherwise false
    public func isEmpty() -> Bool {
        return first == nil
    }
    
    public struct  BagIterator<E> : IteratorProtocol {
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
    public func makeIterator() -> BagIterator<E> {
        return BagIterator<E>(first)
    }
}
extension Bag: CustomStringConvertible {
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1), " }
    }
}
