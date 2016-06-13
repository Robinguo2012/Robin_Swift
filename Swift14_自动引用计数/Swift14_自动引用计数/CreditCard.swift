//
//  CreditCard.swift
//  Swift14_自动引用计数
//
//  Created by sks on 16/6/7.
//  Copyright © 2016年 sks. All rights reserved.
//

class CreditCard {

    let num:UInt64
    
    unowned let customer: Customer
    
    init(num: UInt64, customer: Customer){
        self.num = num
        self.customer = customer
    }
    
    deinit{
        print("Card #\(num) is being deinitializd")
    }
}
