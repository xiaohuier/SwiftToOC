//
//  FibonacciSequence.swift
//  DataStructure
//
//  Created by EastZhou on 2019/10/13.
//  Copyright © 2019 EastZhou. All rights reserved.
//

import Foundation
func FibonacciSequenceFor(count :Int) -> Array<Int> {
    var array = [Int]()
    array.append(0)
    if count < 1 {
        return array
    }
    array.append(1)
    if count < 2 {
        return array
    }
    for i in (2 ..< count) {
        array.append(array[i - 1] + array[i - 2])
    }
    return array
}

func FibonacciSequenceRecursion(count :Int) -> Array<Int> {
    func fbi(i: Int) ->Int {
        if i < 2 {
            return i == 0 ? 0 : 1
        }
        return fbi(i: i - 1) + fbi(i: i - 2)
    }
    var array = [Int]()
    for i in 0 ..< count {
        array.append(fbi(i: i))
    }
    return array
}

