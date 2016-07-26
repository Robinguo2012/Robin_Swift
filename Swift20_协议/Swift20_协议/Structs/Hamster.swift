//
//  Hamster.swift
//  Swift20_协议
//
//  Created by sks on 16/7/26.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

struct Hamster {
    var name:String
    
    var textualDescription: String{
        return "A hasmter named \(name)"
    }
}

extension Hamster: TextRepresentable{}
