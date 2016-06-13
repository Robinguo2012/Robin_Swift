//
//  main.swift
//  Swift06_枚举
//
//  Created by Robin Guo on 16/5/29.
//  Copyright © 2016年 Robin Guo. All rights reserved.
//

import Foundation

//print("Hello, World!")
enum CompassPoint{
    case East
    case North
    case South
    case West
}

enum Animals {
    case Cat,Dog,Cow,Wolf,Pig,Snake
}

enum Planet {
    case Mercury,Venus,Earth,Mars,Jupiter,Saturn,Uranus,Nepture
}

var directionToHead = CompassPoint.West;
directionToHead = .North;


// switch 必须穷举所有情况
switch directionToHead{
    
case .North:
    print("Lots of planets have a north")
case .South:
    print("Watch out of penguins")
case .West:
    print("Where the skies is blue")
case .East:
    print("Where the sun rises")
    
}

// 关联值
enum Barcode {
    case UPCA(Int,Int,Int,Int)
    case QRCode(String)
}

var productBarcode = Barcode.UPCA(8, 85990, 51226, 3)
productBarcode = .QRCode("ABCCEFALDFAD")

switch productBarcode{
    
case let .UPCA(system,manufacturer,product,code):
    print("UPC-A: \(system) \(manufacturer) \(product) \(code)")
case let .QRCode(productCode):
    print("QRCode: \(productCode)")
}

// 原始值 (始终不能变化)
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

/*
 隐式设置原始值
 当使用字符串作为枚举类型的原始值时，每个枚举成员的隐式原始值为该枚举成员的名称。
 */

enum Planet1:Int {
    case Mercury = 1,Venus,Mars,Earth
}


let earthsOrder = Planet1.Earth.rawValue;
print("\(earthsOrder)")






