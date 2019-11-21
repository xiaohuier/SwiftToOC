//
//  BST.swift
//  DataStructure
//
//  Created by EastZhou on 2019/10/20.
//  Copyright © 2019 EastZhou. All rights reserved.
//

import Foundation
extension Int: EmptyData {
    func empty() -> Int {
        return 0
    }
}

func searchBST(tree: ChainTree<Int>, value: Int) -> TreeChainNode<Int>? {
    var current: TreeChainNode<Int>? = nil
    func findNode(node :TreeChainNode<Int>) {
        current = node
        if let currentValue = node.value {
            if currentValue > value {
                if let left = node.leftChild {
                    findNode(node: left)
                }
            } else if currentValue < value {
                if let right = node.rightChild {
                    findNode(node: right)
                }
            }
        }
    }
    findNode(node: tree.root)
    return current
}

func insertBST(tree: ChainTree<Int>, value: Int) {
    let searchNode = searchBST(tree: tree, value: value)
    if searchNode != nil {
        if searchNode?.value == value {
            return
        }
        let node = TreeChainNode(value: value)
        if let searchNodeValue = searchNode?.value {
            if value < searchNodeValue {
                searchNode?.leftChild = node
            } else {
                searchNode?.rightChild = node
            }
        }
    }
}
