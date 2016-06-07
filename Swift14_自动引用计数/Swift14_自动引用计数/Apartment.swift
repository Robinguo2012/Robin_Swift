//
//  Apartment.swift
//  Swift14_自动引用计数
//
//  Created by sks on 16/6/7.
//  Copyright © 2016年 sks. All rights reserved.
//

class Apartment {
    let unit: String
    init(unit: String){
        self.unit = unit
    }
   // var person:Person?
    weak var person:Person?
    deinit{
        print("Apartment \(unit) is being deinitialized")
    }
}
