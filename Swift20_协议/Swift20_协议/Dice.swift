//
//  Dice.swift
//  Swift20_协议
//
//  Created by sks on 16/7/26.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

class Dice {
    /*
     作为函数、方法或构造器中的参数类型或返回值类型
     作为常量、变量或属性的类型
     作为数组、字典或其他容器中的元素类型
     */
    let sides: Int
    let generator: MethodProtocol
    
    init(sides: Int, generator: MethodProtocol){
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int{
        return Int(self.generator.random() * Double(sides)) + 1
    }
}
