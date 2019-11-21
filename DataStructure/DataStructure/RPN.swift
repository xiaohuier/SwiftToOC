//
//  RPN.swift
//  DataStructure
//
//  Created by EastZhou on 2019/10/13.
//  Copyright © 2019 EastZhou. All rights reserved.
//

import Foundation
// 后缀表达式
class RPN {
    static func result(string: String) -> Int {
        let statck = ChainStack<Int>()
        let array = string.components(separatedBy: " ")
        for (_, oneString) in array.enumerated() {
            if oneString.isNumber() {
                statck.push(ele: Int(oneString)!)
            } else if oneString.isOperator() {
                let number1 = statck.pop()
                let number2 = statck.pop()
                statck.push(ele: toCount(number2, number1, operatorString: oneString))
                print("statck = \(statck)")
            }
        }
        
        return statck.pop()
    }
    
    // 中缀转换成后缀
    static func convert(string: String) -> String {
//        func popStack() {
//
//        }
//        // 有点难啊
//
//        let statck = ChainStack<String>()
//        let array = string.components(separatedBy: " ")
//        var rel = ""
//        for (_, oneString) in array.enumerated() {
//            var needPop = false
//            if oneString.isNumber() {
//                rel += "\(oneString) "
//            } else if oneString.isLeftParenthesis() {
//
//                statck.push(ele: oneString)
//            } else if oneString.isOperator() {
//                if oneString.islowLevel(statck.head.value!) {
//                    needPop = true
//                } else {
//                    statck.push(ele: oneString)
//                }
//            } else {
//                needPop = true
//            }
//
//            var current = statck.head
//            while current.value!.isLeftParenthesis() == false {
//                if current.value!.isOperator() {
//                    rel += "\(current.value!) "
//                }
//                let _ = statck.pop()
//                if let next = current.next {
//                    current = next
//                }
//            }
//            let _ = statck.pop()// 去掉右边括号
//        }
//    }
//    let _ = rel.removeLast()
    return ""
}

static func toCount(_ number1 : Int, _ number2 : Int, operatorString: String) -> Int {
    if operatorString == "+" {
        return number1 + number2
    } else if operatorString == "-" {
        return number1 - number2
    } else if operatorString == "*" {
        return number1 * number2
    } else {
        return number1 / number2
    }
}
}

extension String {
    func isNumber() -> Bool {
        let scan: Scanner = Scanner(string: self)
        var val:Int = 0
        return scan.scanInt(&val) && scan.isAtEnd
    }
    
    func isOperator() -> Bool {
        let array = ["+","-","*","/"]
        return array.contains(self)
    }
    
    func isLeftParenthesis() -> Bool {
        return self == "("
    }
    
    func isRightParenthesis() -> Bool {
        return self == ")"
    }
    
    func islowLevel(_ other: String) -> Bool {
        if self.isOperator() {
            let array = ["*","/"]
            return !array.contains(self) && array.contains(other)
        }
        fatalError()
    }
}
