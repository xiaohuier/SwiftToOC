//
//  Queue.swift
//  DataStructure
//
//  Created by EastZhou on 2019/10/14.
//  Copyright © 2019 EastZhou. All rights reserved.
//

import Foundation
class Queue<Element> {
    func destoryQueue() {
        fatalError()
    }
    func clearQueue() {
        fatalError()
    }
    func isEmpty() -> Bool {
        fatalError()
    }
    func head() -> Element {
        fatalError()
    }
    func insert(ele :Element) {
        fatalError()
    }
    func delete() -> Element {
        fatalError()
    }
    func length() -> Int {
        fatalError()
    }
}

// 循环队列
class LoopQueue<Element>: Queue<Element> {
    var front = 0 // 尾指针
    var rear = 0 // 头指针
    let maxSize = 10
    var dic = [Int : Element]()
    
    override func length() -> Int {
        return (rear - front + maxSize) % maxSize
    }
    
    override func insert(ele: Element) {
        if isFull() {
            fatalError("Queue is full")
        }
        self.dic[rear] = ele
        rear += 1
    }
    
    override func delete() -> Element {
        if self.isEmpty() {
            fatalError("Queue is empty")
        }
        let ele = self.dic[front]
        front += 1
        return ele!
    }
    
    func isFull() -> Bool {
        return (rear + 1) % self.maxSize == front
    }
    
    override func isEmpty() -> Bool {
        return rear == front
    }
}

class QueueNode<Element> :CustomStringConvertible {
    init(value: Element?) {
        self.value = value
    }
    var value :Element? = nil
    var next :QueueNode?
    
    var description: String {
        return "\(String(describing: self.value))"
    }
}

class ChainQueue<Element>: Queue<Element> {
    var head = QueueNode<Element>(value: nil)
    var front: QueueNode<Element>// 尾指针 指向最后一个值
    var rear: QueueNode<Element> // 头指针 指向队列头的前一个值
    var queueLength = 0
    let maxSize = 10
    
    override init() {
        self.front = self.head
        self.rear = self.head
    }
    
    override func length() -> Int {
        return self.queueLength
    }
    
    override func insert(ele: Element) {
        if isFull() {
            fatalError("Queue is full")
        }
        self.queueLength += 1
        let newNode = QueueNode(value: ele)
        newNode.next = head
    
        self.front.next = newNode
        self.front = newNode
    }
    
    override func delete() -> Element {
        if self.isEmpty() {
            fatalError("Queue is empty")
        }
        self.queueLength -= 1
        let current = self.rear
        let delete = self.rear.next!
        let ele = delete.value!
        if (delete.next != nil) {
            current.next = delete.next
        }
        return ele
    }
    
    func isFull() -> Bool {
        return self.queueLength == self.maxSize
    }
    
    override func isEmpty() -> Bool {
        return self.queueLength == 0
    }
}
