//
//  Customer.swift
//  Swift14_自动引用计数
//
//  Created by sks on 16/6/7.
//  Copyright © 2016年 sks. All rights reserved.
//


class Customer {

    let name:String
    var creditCard:CreditCard?
    
    init(name: String){
        self.name = name
    }
}
