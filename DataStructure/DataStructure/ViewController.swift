//
//  ViewController.swift
//  DataStructure
//
//  Created by EastZhou on 2019/10/11.
//  Copyright © 2019 EastZhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let sequenceLineList = SequenceLineList<Int>(array: [10, 12 ,15])
//        self.lineListTest(list: sequenceLineList)
//
//        let chainLineList = ChainLineList(array: [7, 8 ,9])
//        self.lineListTest(list: chainLineList)
//        print("chainLineList = \(chainLineList)")
        
//        print("\(FibonacciSequenceFor(count: 40).count), \(FibonacciSequenceFor(count: 40))")
//        print("\(FibonacciSequenceRecursion(count: 40).count), \(FibonacciSequenceRecursion(count: 40))")
        
//        let rpn = RPN.result(string: "9 3 1 - 3 * + 10 2 / +")
//        print("rpn get result = \(rpn)")
//        let newRpn = RPN.result(string: RPN.convert(string: "9 + ( 3 - 1 ) * 3 + 10 / 2"))
//        print("newRpn get result = \(newRpn)")
        
//       let string = CharString(charSet: ["a","b","a","b","a","a","a","b","a"])
//        let next = string.next()
//        print("next = \(next)")
//
//        let valnext = string.nextVal()
//        print("valnext = \(valnext)")
        
//        let string = CharString(charSet: ["a","b","a","b","a","a","a","b","a"])
//        let subString = CharString(charSet: ["a", "a"])
//        let kmpIndex = string.kmpIndex(other: subString)
//        let index = string.index(other: subString)
//        print("kmpIndex = \(kmpIndex), index = \(index)")
        
//        let tree = ChainTree(preNodes: ["A","B","#","D","#","#","C","#","#"])
//        print("tree pre = \(tree.preOrderTraverse())")
        
//        let tree = ChainTree(preNodes: ["A","B","D","G","#","#","H","#","#","#","C","E","#","I","#","#","F","#","#"])
//        print("tree pre = \(tree.preOrderTraverse())")
//        print("tree mid = \(tree.midOrderTraverse())")
//        print("tree pre = \(tree.postOrderTraverse())")
        
//        let array = [0,1,16,24,35,47,59,62,73,88,99]
//        var index = binarySeach(data: array, value: 62);
//        print("seach index = \(index)")
//        
//        index = interpolationSeach(data: array, value: 62);
//        print("seach index = \(index)")
        
//        let array = [88,58,47,35,73,51,99,37,93]
//        let bstTree = ChainTree(value: 62)
//        for (_ ,value) in array.enumerated() {
//            insertBST(tree: bstTree, value: value)
//        }
//        let node = searchBST(tree: bstTree, value: 51)
//        print("node = \(node)")
        
        let array = [1,88,58,47,35,73,51,99,37,93,11,91,72,2]
        var ret = bubbleSort0(array)
        print("sort0 = \(ret)")
        
        ret = bubbleSort1(array)
        print("sort1 = \(ret)")
        
        ret = bubbleSort2(array)
        print("sort2 = \(ret)")
        
        ret = insertSort(array)
        print("insert = \(ret)")
        
        print("cube = \(cube(n: 4))")
    }

    func lineListTest(list: LineList<Int>) {
        list.insert(element: 4, index: 0)
        print("add list = \(list)")
        list.insert(element: 3, index: 0)
        print("add list = \(list)")
        list.insert(element: 2, index: 0)
        print("add list = \(list)")
        list.insert(element: 1, index: 0)
        print("add list = \(list)")
        let ele = list.delete(index: 3)
        print("delete obj = \(String(describing: ele))")
    
    }
}

