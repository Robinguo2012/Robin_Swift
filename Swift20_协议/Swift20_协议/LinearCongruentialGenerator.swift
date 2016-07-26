//
//  LinearCongruentialGenerator.swift
//  Swift20_协议
//
//  Created by sks on 16/7/26.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

class LinearCongruentialGenerator:MethodProtocol {

    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    
    
    
    static func someTypeMethod() {
        
    }
    
    static func someAnotherMethod() {
        
    }
    
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
    
//    func random() -> Double {
//        lastRandom = ((lastRandom * a + c) % m)
//        return lastRandom/m
//    }

}

enum OnOffSwitch: Togglable {
    case On,Off
    
    mutating func toggle() {
        switch self {
        case On:
            self = Off
        case .Off:
            self = On
        }
    }
}