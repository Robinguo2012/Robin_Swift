//
//  Circle.swift
//  Swift20_协议
//
//  Created by sks on 16/7/27.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

class Circle: HasArea {
    let pi = 3.1415926
    var radius: Double
    var area: Double{
        return radius * radius * pi
    }
    init(radius: Double){
        self.radius = radius
    }
}
