//
//  String.swift
//  DataStructure
//
//  Created by EastZhou on 2019/10/15.
//  Copyright © 2019 EastZhou. All rights reserved.
//

import Foundation
class CharString: NSCopying, Equatable {
    static func == (lhs: CharString, rhs: CharString) -> Bool {
        return lhs.charSet == rhs.charSet
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return ""
    }
    
    var charSet: [Character]
    init(charSet: [Character]) {
        self.charSet = charSet
    }
    
    func isEmpty() -> Bool {
        fatalError()
    }
    
    func subString(pos: Int, length: Int) -> CharString {
        var array = [Character]()
        for i in (pos ..< pos + length) {
            array.append(self.charSet[i])
        }
        return CharString(charSet: array)
    }
    
    func index(other: CharString) -> Int {
        let currentLength = self.length()
        let otherLength = other.length()
      
            var i = 0
            while i <= (currentLength - otherLength + 1) {
                let subSting = self.subString(pos: i, length: otherLength)
                if subSting == other {
                    return i
                } else {
                    i += 1
                }
            }
        return 0
    }
    
    func kmpIndex(other: CharString) -> Int {
        var i = 0//主串
        var j = 0//子串
        let currentLength = self.length()
        let otherLength = other.length()
    
        let next = other.next()
        print("kmpIndex = \(other.charSet) in \(self.charSet)")
        while i < currentLength && j < otherLength {
            print("j = \(j + 1) , i = \(i + 1)")
            if j == -1 || self.charSet[i] == other.charSet[j] {
                i += 1
                j += 1
            } else {
                j = next[j] - 1
            }
        }
        if j == otherLength {
            return i - otherLength
        }
        return 0
    }
    
    
    func replace(_ string: CharString, to toString: String) {
        
    }
    func insert(_ string: CharString, pos: Int) {
        
    }
    func delete(pos: Int, length: Int) {
        
    }
    
    func length() -> Int {
        return self.charSet.count
    }
    
    func next() -> [Int] {
        
        var array = [Int]()
        array.append(0) // nil
        array.append(1) // 第一个字符
        
        for j in (2 ..< self.length()) {
            let subString = self.subString(pos: 0, length: j)
            let subStringArray = subString.charSet
            
            let count = subStringArray.count / 2 + (subStringArray.count % 2 > 0 ? 1 : 0)
            var hasEqual = false
            for i in (0 ..< count).reversed() {
                let headString = subString.subString(pos: 0, length: i + 1).charSet
                let endString = subString.subString(pos: subString.length() - i - 1, length: i + 1).charSet
                if headString == endString {
                    array.append(i + 2)
                    hasEqual = true;
                    break
                }
            }
            if hasEqual == false {
                array.append(1)
            }
        }
        
        
        return array
    }
    
    func nextVal() -> [Int] {
        
        var array = [Int]()
        array.append(0)
        array.append(1)
        
        for j in (2 ..< self.length()) {
            let subString = self.subString(pos: 0, length: j)
            let subStringArray = subString.charSet
            
            let count = subStringArray.count / 2 + (subStringArray.count % 2 > 0 ? 1 : 0)
            var hasEqual = false
            for i in (0 ..< count).reversed() {
                let headString = subString.subString(pos: 0, length: i + 1).charSet
                let endString = subString.subString(pos: subString.length() - i - 1, length: i + 1).charSet
                if headString == endString {
                    array.append(i + 2)
                    hasEqual = true;
                    break
                }
            }
            if hasEqual == false {
                array.append(1)
            }
            
            let index = array.last!
            let current = array.count - 1
            if self.charSet[index - 1] ==  self.charSet[current] {
                array[current] = array[index - 1]
            }
        }
        return array
    }

}
