//
//  Int_Extension.swift
//  Swift19_扩展
//
//  Created by sks on 16/7/25.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

extension Int{
    //方法（Methods）
    func repetitions(task:() -> Void) {
        
        for _ in 0..<self {
            task()
        }
    }
    
    // 可变实例方法 (mutating instance method) 
    /*
     通过扩展添加的实例方法也可以修改该实例本身
     */
    mutating func square() {
        self = self * self
    }
    
    subscript (digitIndex: Int) -> Int{
    
        var decimalBase = 1
        for _ in 0..<digitIndex{
            decimalBase *= 10
        }
        
        return (self/decimalBase) % 10
    }
    
    enum Kind {
        case Positive, Negative, Zero
    }
    
    var kind:Kind{
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
    
}