//
//  LineList.swift
//  DataStructure
//
//  Created by EastZhou on 2019/10/11.
//  Copyright © 2019 EastZhou. All rights reserved.
//

import Foundation

class ChainLineListNode<Element> {
    init(value: Element?) {
        self.value = value
    }
    var value :Element? = nil
    var next :ChainLineListNode?
}

class LineList<Element>: CustomStringConvertible {
    let maxSize = 100
    init(array :Array<Element>) {
        
    }
    
    func isEmpty() -> Bool {
        fatalError()
    }
    
    func clearList() -> Bool {
        fatalError()
    }
    func getElement(index :Int) -> Element? {
        fatalError()
    }
    func index(element: Element) -> Int {
        fatalError()
    }
    func insert(element: Element, index: Int) {
        fatalError()
    }
    func delete(index: Int) -> Element? {
        fatalError()
    }
    
    func length() -> Int {
        fatalError()
    }
    
    var description: String {
        return ""
    }
}

class SequenceLineList<Element>: LineList<Element> {
    var array = [Element]()
    private var listLength = 0
    
    override init(array: Array<Element>) {
        super.init(array: array)
        self.array = array
        self.listLength = array.count
    }
    
    override func isEmpty() -> Bool {
        return self.listLength == 0 ? true : false
    }
    
    //    func clearList() -> Bool {
    //        fatalError()
    //    }
    //    func getElement() -> Element {
    //        fatalError()
    //    }
    //    func index(element: Element) -> Int {
    //        fatalError()
    //    }
    override func insert(element: Element, index: Int) {
        if index >= self.maxSize {
            fatalError("\(self) is full")
        }
        if index > self.listLength {
            fatalError("\(self) not in range")
        }
        
        if index == self.listLength {
            // 插在了末尾
            self.array.append(element)
        } else {
            var tmp = [Element]()
            for (oldIndex, obj) in self.array.enumerated() {
                if oldIndex == index {
                    tmp.append(element)
                    tmp.append(obj)
                } else {
                    tmp.append(obj)
                }
            }
            self.array = tmp
        }
        self.listLength += 1
    }
    
    override func delete(index: Int) -> Element {
        if index >= self.listLength {
            fatalError("\(self) not in range")
        }
        var tmp = [Element]()
        var ele: Element? = nil
        for (oldIndex, obj) in self.array.enumerated() {
            if oldIndex == index {
                ele = obj
            } else {
                tmp.append(obj)
            }
        }
        self.array = tmp
        self.listLength -= 1
        return ele!
    }
    
    override func length() -> Int {
        return self.listLength
    }
    
    override var description: String {
        return "SequenceLineList \(self.array)"
    }
    
}

class ChainLineList<Element>: LineList<Element> {
    var listHead: ChainLineListNode<Element>?
    
    override init(array: Array<Element>) {
        super.init(array: array)
        let head = ChainLineListNode<Element>(value: nil)
        self.listHead = head
        var current = head
        for (_, obj) in array.enumerated() {
            let next = ChainLineListNode(value: obj)
            current.next = next
            current = next
        }
    }
    
    
    override func getElement(index :Int) -> Element? {
        var count = 0
        var current = listHead
        while count <= index {
            if let _ = current?.next {
                current = current?.next
                count += 1
            } else {
                return nil
            }
        }
        return current?.value
    }
    
    override func insert(element: Element, index: Int) {
        var count = 0
        var current = listHead
        while count < index {
            if let _ = current?.next {
                current = current?.next
                count += 1
            } else {
                fatalError("not in range")
            }
        }
        let newNode = ChainLineListNode(value: element)
        let last = current
        if let next = last?.next {
            // 插入到了中间
            last?.next = newNode
            newNode.next = next
        } else {
            // 插入到了表尾
            last?.next = newNode
        }
    }
    
    override func delete(index: Int) -> Element? {
        var count = 0
        var current = listHead
        while count < index {
            if let _ = current?.next {
                current = current?.next
                count += 1
            } else {
                fatalError("not in range")
            }
        }
    
        let last = current
        if last?.next == nil {
            fatalError("not in range")
        }
        let delete = last?.next
        if let deleteNext = delete?.next {
            // 删除中间
            last?.next = deleteNext
        } else {
            // 删除表尾
            last?.next = nil
        }
        return delete?.value
    }
    
    override var description: String {
        var array = [Element]()
        var current = listHead!
        while current.next != nil {
            if let value = current.value {
                array.append(value)
            }
            current = current.next!
        }
        return "ChainLineList \(array)"
    }
}

// 静态链表
class StaticChainLineList<Element>: LineList<Element> {
    
}
