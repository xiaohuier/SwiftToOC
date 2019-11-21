//
//  Cube.swift
//  DataStructure
//
//  Created by EastZhou on 2019/11/4.
//  Copyright © 2019 EastZhou. All rights reserved.
//

import Foundation
func cube(n: Int) -> [[Int]] {
    var min = 1
    var max = n
    
    var array = [(Int, Int)]()
    
    while max > min {
        var i = min
        var j = min
        
        while j < max {
            array.append((i, j))
            j += 1
        }
        
        while i < max {
            array.append((i, j))
            i += 1
        }
        
        while j > min {
            array.append((i, j))
            j -= 1
        }
        
        while i > min {
            array.append((i, j))
            i -= 1
        }
        
        max -= 1
        min += 1
    }
    print("array = \(array)")

    var rel = [[Int]]()
    for x in 1 ..< n + 1 {
        var relArray = [Int]()
        for y in 1 ..< n + 1 {
            let pos = (x, y)
            if let index = array.firstIndex(where: { (x, y) -> Bool in
                return  x == pos.0 && y == pos.1
            }) {
                relArray.append(index + 1)
            }
        }
        rel.append(relArray)
    }
    return rel
}
