//
//  Starship.swift
//  Swift20_协议
//
//  Created by sks on 16/7/26.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

class Starship: FullyNamed, SomeInitProtocol {

    var prefix:String?
    var name:String
    var someInt:Int = 0
    
    init(name: String, prefix:String? = nil){
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + " " : " ") + name
    }
    
    required init(someInt: Int) {
        self.prefix = nil
        self.name = ""
        self.someInt = someInt
    }
}

//var ncc1070 = Starship(name: "Enterprise", prefix: "USS")
//
//print("fullname \(ncc1070.fullName)")



