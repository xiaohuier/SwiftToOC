//
//  Tree.swift
//  DataStructure
//
//  Created by EastZhou on 2019/10/17.
//  Copyright © 2019 EastZhou. All rights reserved.
//

import Foundation

protocol EmptyData: Equatable {
    func empty() -> Self
}

extension String: EmptyData {
    func empty() -> String {
        return "#"
    }
}
class TreeNode<Element> :CustomStringConvertible {
    init(value: Element?) {
        self.value = value
    }
    var value :Element? = nil
    
    var description: String {
        return "\(String(describing: self.value))"
    }
}

class TreeChainNode<Element> :CustomStringConvertible {
    init(value: Element?) {
        self.value = value
    }
    var value :Element? = nil
    var leftChild :TreeChainNode?
    var rightChild :TreeChainNode?
    
    var description: String {
        return "\(String(describing: self.value))"
    }
}

class ChainTree<Element> where Element: EmptyData {
    let root: TreeChainNode<Element>
    init(value: Element) {
        self.root = TreeChainNode(value: value)
    }
    
    init(preNodes: [Element]) {
        let count = preNodes.count
        var index = 0
        func creatNode() -> TreeChainNode<Element>? {
            if index >= count {
                return nil
            }
            let value = preNodes[index]
            index += 1
            if value != value.empty() {
                let node = TreeChainNode(value: value)
                node.leftChild = creatNode()
                node.rightChild = creatNode()
                
                return node
            }
            return nil
        }
        
        self.root = creatNode()!
    }
    
    func treeRoot() -> TreeChainNode<Element> {
        return self.root
    }
    func value(index :Int) -> Element? {
        return nil
    }
    func setValue(index: Int, ele: Element) {
        
    }
    
    func preOrderTraverse() -> [Element] {
        var array = [Element]()
        func traverse(_ node: TreeChainNode<Element>) {
            if let value = node.value {
                array.append(value)
            }
            if let left = node.leftChild {
                traverse(left)
            }
            if let right = node.rightChild {
                traverse(right)
            }
        }
        traverse(self.treeRoot())
        return array
    }
    
    func midOrderTraverse() -> [Element] {
        var array = [Element]()
        func traverse(_ node: TreeChainNode<Element>) {
            if let left = node.leftChild {
                print("left \(left.value)")
                traverse(left)
            }
            if let value = node.value {
                print("current \(value)")
                array.append(value)
            }
            if let right = node.rightChild {
                print("right \(right.value)")
                traverse(right)
            }
        }
        traverse(self.treeRoot())
        return array
    }
    
    func postOrderTraverse() -> [Element] {
        var array = [Element]()
        func traverse(_ node: TreeChainNode<Element>) {
            if let left = node.leftChild {
                traverse(left)
            }
            if let right = node.rightChild {
                traverse(right)
            }
            if let value = node.value {
                array.append(value)
            }
        }
        traverse(self.treeRoot())
        return array
    }
    
}
