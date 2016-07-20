//
//  main.swift
//  Swift16_错误处理
//
//  Created by Robin Guo on 16/7/6.
//  Copyright © 2016年 Robin Guo. All rights reserved.
//

import Foundation

// 用一个枚举表示错误状态和信息
enum VendingMachineError: ErrorType{
    case InvalidSelection
    case InsufficientFunds(coinsNeed:Int)
    case OutOfStock
}

// 抛出一个错误,提示金额不足
throw VendingMachineError.InsufficientFunds(coinsNeed: 5)

// swift 有4中错误处理的方式
/*
 你可以把函数抛出的错误传递给调用此函数的代码、
  用do-catch语句处理错误、
  将错误作为可选类型处理、
  或者断言此错误根本不会发生
 */

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = ["Candy car":Item(price:5,count: 7),
                     "Chips":Item(price: 8, count: 9),
                     "Pretzels":Item(price: 20,count: 9)]
    
    var coinsDeposited = 0
    
    func vend(itemName name: String) throws {
        
        guard let item = inventory[name] else{
            throw VendingMachineError.InvalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.OutOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.InsufficientFunds(coinsNeed: item.price - coinsDeposited)
        }
    }
}

