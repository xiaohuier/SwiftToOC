//
//  Sort.swift
//  DataStructure
//
//  Created by EastZhou on 2019/10/20.
//  Copyright © 2019 EastZhou. All rights reserved.
//

import Foundation
func bubbleSort0(_ data: [Int]) -> [Int] {
    var ret = data
    let length = data.count
    var count = 0
    for i in 0 ..< length {
        for j in i + 1 ..< length {
            let valuei = ret[i]
            let valuej = ret[j]
            count += 1
            if valuei > valuej {
                ret.swapAt(i, j)
            }
        }
    }
    print("bubbleSort0 count = \(count)")
    return ret
}

func bubbleSort1(_ data: [Int]) -> [Int] {
    var ret = data
    let length = data.count
    var count = 0
    for i in stride(from: length - 1, through: 0, by: -1) {
        for j in stride(from: 0, through: i - 1, by: 1) {
            let valuej = ret[j]
            let valueNext = ret[j + 1]
            count += 1
            if valuej > valueNext {
                ret.swapAt(j, j + 1)
            }
        }
    }
    print("bubbleSort1 count = \(count)")
    return ret
}

func bubbleSort2(_ data: [Int]) -> [Int] {
    var ret = data
    let length = data.count
    var count = 0
    var flag = true
    
    for i in stride(from: length - 1, through: 0, by: -1) {
        if flag == true {
            flag = false
            for j in stride(from: 0, through: i - 1, by: 1) {
                let valuej = ret[j]
                let valueNext = ret[j + 1]
                count += 1
                if valuej > valueNext {
                    ret.swapAt(j, j + 1)
                    flag = true
                }
            }
        }
    }
    print("bubbleSort2 count = \(count)")
    return ret
}

func insertSort(_ data: [Int]) -> [Int] {
    var ret = data
    for i in 0 ..< ret.count {
        let valuei = ret[i]
        var min = i
        while min > 0 && valuei > ret[min - 1] {
            ret[min] = ret[min - 1]
            min -= 1
        }
        ret[min] = valuei
    }
    return ret
}

func shellSort(_ data: [Int]) -> [Int] {
    var ret = data
    for i in 0 ..< ret.count {
        let valuei = ret[i]
        var min = i
        while min > 0 && valuei > ret[min - 1] {
            ret[min] = ret[min - 1]
            min -= 1
        }
        ret[min] = valuei
    }
    return ret
}
