//
//  Stack.swift
//  DataStructure
//
//  Created by EastZhou on 2019/10/13.
//  Copyright © 2019 EastZhou. All rights reserved.
//

import Foundation
class Stack<Element>: CustomStringConvertible {
    var description: String {
        return ""
    }
    func destoryStack() {
        fatalError()
    }
    func clearStack() {
        fatalError()
    }
    func isEmpty() -> Bool {
        fatalError()
    }
    func top() -> Element {
        fatalError()
    }
    func push(ele :Element) {
        fatalError()
    }
    func pop() -> Element {
        fatalError()
    }
    func length() -> Int {
        fatalError()
    }
}

class SequenceStack<Element>: Stack<Element> {
    var array = [Element]()
    var topElementCount: Int = 0
    
    override func isEmpty() -> Bool {
        return topElementCount == 0
    }
    
    override func push(ele: Element) {
        self.array.append(ele)
        self.topElementCount += 1
    }
    
    override func pop() -> Element {
        if self.topElementCount == 0 {
            fatalError("is empty stack")
        }
        let ele = self.array[self.topElementCount]
        self.array.remove(at: self.topElementCount)
        self.topElementCount -= 1
        return ele
    }
}

class SequenceShareStack<Element> {
    let maxSize: Int
    
    
    class SequenceStack<Element> {
        var topElementCount = 0
        // 以int key ： value的形式模拟指针操作
        var dic = [Int : Element]()
        func set(object :Element, forKey key :Int) {
            self.dic[key] = object
        }
    }
    
    let stack1 = SequenceStack<Element>()
    let stack2 = SequenceStack<Element>()
    
    
    init(maxSize: Int) {
        self.maxSize = maxSize
    }
    
    func push(ele: Element, stackNumber: Int) {
        if self.stack1.topElementCount == self.stack2.topElementCount - 1 {
            fatalError("full stack")
        }
        if stackNumber == 1 {
            self.stack1.topElementCount += 1
            let newIndex = self.stack1.topElementCount
            if isFullStack(stack: self.stack1) {
                self.stack2.set(object: ele, forKey: newIndex)
            } else {
                self.stack1.set(object: ele, forKey: newIndex)
            }
        } else {
            self.stack2.topElementCount -= 1
            let newIndex = self.stack2.topElementCount
            if isFullStack(stack: self.stack2) {
                self.stack1.set(object: ele, forKey: newIndex)
            } else {
                self.stack2.set(object: ele, forKey: newIndex)
            }
        }
    }
    
    func pop(stackNumber: Int) -> Element {
        var ele: Element? = nil
        
        if stackNumber == 1 {
            if self.stack1.topElementCount == 0 {
                fatalError("empty stack")
            }
            self.stack1.topElementCount -= 1
            let newIndex = self.stack1.topElementCount
            if newIndex <= self.maxSize / 2 {
                ele = self.stack1.dic[newIndex]
                self.stack1.dic[newIndex] = nil
            } else {
                ele = self.stack2.dic[newIndex]
                self.stack2.dic[newIndex] = nil
            }
            
        } else {
            if self.stack1.topElementCount == self.maxSize {
                fatalError("empty stack")
            }
            self.stack2.topElementCount += 1
            let newIndex = self.stack2.topElementCount
            if newIndex > self.maxSize / 2 {
                ele = self.stack2.dic[newIndex]
                self.stack2.dic[newIndex] = nil
            } else {
                ele = self.stack1.dic[newIndex]
                self.stack1.dic[newIndex] = nil
            }
        }
        return ele!
    }
    
    func isFullStack(stack: SequenceStack<Element>) -> Bool {
        if stack === self.stack1 {
            return stack.topElementCount == self.maxSize / 2
        }
        if stack === self.stack2 {
            return self.maxSize - stack.topElementCount == self.maxSize / 2
        }
        return false
    }
}

class StackNode<Element> :CustomStringConvertible {
    init(value: Element?) {
        self.value = value
    }
    var value :Element? = nil
    var next :StackNode?
    
    var description: String {
        return "\(String(describing: self.value))"
    }
}

class ChainStack<Element>: Stack<Element> {
    var head = StackNode<Element>(value: nil)
    
    override func push(ele: Element) {
        if self.head.value == nil {
            self.head.value = ele
        } else {
            let newNode = StackNode(value: ele)
            newNode.next = self.head
            self.head = newNode
        }
    }
    
    override func pop() -> Element {
        if self.head.value != nil {
            let value = self.head.value!
            if let _ = self.head.next {
                self.head = self.head.next!
            } else {
                self.head.value = nil
                self.head.next = nil
            }
            return value
        } else {
            fatalError("is empty stack")
        }
    }
    
    override var description: String {
        var array = [Element]()
        var current = self.head
        while (current.next != nil) {
            if let value = current.value {
                array.append(value)
            }
            current = current.next!
        }
        if let value = current.value {
            array.append(value)
        }
        array = array.reversed()
        return "\(array)"
    }
}
