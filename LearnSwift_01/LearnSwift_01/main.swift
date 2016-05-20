//
//  main.swift
//  LearnSwift_01
//
//  Created by Robin Guo on 16/5/17.
//  Copyright © 2016年 Robin Guo. All rights reserved.
//

import Foundation

print("Hello, World!")

// 基本数据类型
var int_num = 10
var double_num = 10.00;
var name = "Robin"
print("my name is \(name)")

let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11

// 浮点数
let ex_num0 = 1.25e2
let ex_num1 = 1.25e-2

let ex_pNum0 = 0xFp2
let ex_pNum1 = 0xFp-2

print(ex_pNum0 + ex_pNum1)

//let cannotBeNegative:UInt8 = -1
let tooBig:UInt8 = UInt8.max;
print(tooBig)

// 类型别名
typealias AudioSample = UInt16
var foundNum = AudioSample.max

print("foundNum is \(foundNum)")

let turnipsAreDelicious = false
let oranges = true

if oranges{
    print("I like oranges")
}

// 元组
let HTTP404Code = (404,"Not Found")
print(HTTP404Code.0)
print(HTTP404Code.1)

let (statusCode,statusMessage) = HTTP404Code
print(statusCode)

let possibleNumber = "hello world"
// 可选类型
let IntNum:Int? = Int(possibleNumber)
/*
 Swift 的nil和 Objective-C 中的nil并不一样。在 Objective-C 中，nil是一个指向不存在对象的指针。在 Swift 中，nil不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为nil，不只是对象类型。
 */

// 强制解析
if IntNum != nil{
    print("possibleNumber is \(IntNum!)")
}else{
    print("possbileNumber is nil")
}

// 可选绑定
if let actualNumber = Int(possibleNumber){
    print("'\(possibleNumber)\' has a integer of \(actualNumber))")
     //print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
}else{
    print("\(possibleNumber)\' could not be conerted to integer")
}

// 强制解析 可选类型
let possibleString:String? = "An optional string."
let forcedString:String = possibleString!

let assumedString:String! = "An implicitly unwrapped string"
let implictString:String = assumedString

// 用断言进行错误调试
let age = -3
if age <= 0{
    assert(age >= 0, "A man's age cannot be less than 0")
}


// 异常处理
do{
    
    
}catch{
    
    
}












        