//
//  main.swift
//  Swift07_类和结构体
//
//  Created by sks on 16/5/30.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

// 结构体
struct Resolution {

    var width = 0
    var height = 0
}

// 类定义
class VideoMode {
    
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someVideoMode = VideoMode()
someVideoMode.resolution.width = 1280
someVideoMode.resolution.height = 900

// 枚举和结构体都是值类型 类是构造类型
let hd = Resolution(width: 1980,height: 1080)

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.frameRate = 2.5
tenEighty.interlaced = false
tenEighty.name = "1080pi"

let alsoTenEighty = tenEighty

print("alsoTenEighty :\(alsoTenEighty.name)")



        