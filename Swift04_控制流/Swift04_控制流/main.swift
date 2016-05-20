//
//  main.swift
//  Swift04_控制流
//
//  Created by Robin Guo on 16/5/19.
//  Copyright © 2016年 Robin Guo. All rights reserved.
//

import Foundation

//print("Hello, World!")

for index in 1...5{
    print("\(index) times 5 is \(index*5)")
}

let base = 3
var answer = 5
let power = 10

for _ in 1...power{
    answer *= base
}

print("\(base) to the power \(power) is \(answer)")

//while

//repeat {
//    
//}while()
