//
//  Search.swift
//  DataStructure
//
//  Created by EastZhou on 2019/10/19.
//  Copyright © 2019 EastZhou. All rights reserved.
//

import Foundation
func binarySeach(data: [Int], value: Int) -> Int {
    var startIndex = 0
    var endIndex = data.count - 1
    var current = 0
    
    while current != value {
        let index = (startIndex + endIndex) / 2
        current = data[index]
        if current < value {
            startIndex = index + 1
        } else if current > value {
            endIndex = index - 1
        }
    }
    return (startIndex + endIndex) / 2
}

func interpolationSeach(data: [Int], value: Int) -> Int {
    var startIndex = 0
    var endIndex = data.count - 1
    var current = 0
    var findIndex = 0
    while current != value {
        let index = startIndex + (value - data[startIndex]) / (data[endIndex] - data[startIndex]) * (endIndex - startIndex)
        
        current = data[index]
        if current < value {
            startIndex = index + 1
        } else if current > value {
            endIndex = index - 1
        }
        findIndex = index
    }
    return findIndex
}
