//
//  MethodProtocol.swift
//  Swift20_协议
//
//  Created by sks on 16/7/26.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

protocol MethodProtocol {
//    static func someTypeMethod() // 在协议中定义类方法
//    static func someAnotherMethod() //
    
    func random() -> Double
}

extension MethodProtocol {
    func randomBool() -> Bool{
        return random() > 0.5
    }
}