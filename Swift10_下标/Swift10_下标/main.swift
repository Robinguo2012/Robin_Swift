//
//  main.swift
//  Swift10_下标
//
//  Created by sks on 16/6/1.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

//print("Hello, World!")
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimes = TimesTable(multiplier: 3)
//threeTimes[6]

print("six times three is \(threeTimes[6])")

// 对字典使用下标
/*
 Swift 的Dictionary类型的下标接受并返回可选类型的值。上例中的numberOfLegs字典通过下标返回的是一个Int?或者说“可选的int”。Dictionary类型之所以如此实现下标，是因为不是每个键都有个对应的值，同时这也提供了一种通过键删除对应值的方式，只需将键对应的值赋值为nil即可
 */
var numbersOfLegs = ["spider":8,"ant":6,"cat":4]

numbersOfLegs["bird"] = 2

// 模拟一个矩阵
struct Matrix {
    let rows: Int ,cloumns:Int
    var grid:[Double]
    
    init(rows: Int ,cloumns: Int){
        self.rows = rows
        self.cloumns = cloumns
        grid = Array(count: rows * cloumns ,repeatedValue:0.0)
    }
    
    func IndexIsVaildForRow(row: Int,cloumn: Int) -> Bool {
        return row >= 0 && row < rows && cloumn >= 0 && cloumn < cloumns
    }
    
    subscript(row: Int, cloumn: Int) -> Double{
    
        get{  // read
            assert(IndexIsVaildForRow(row, cloumn: cloumn), "Index out of range")
            return grid[(row * cloumns) + cloumn];
        }
        set{ // write
            assert(IndexIsVaildForRow(row, cloumn: cloumn), "Index out of range")
            grid[(row * cloumns) + cloumn] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, cloumns: 3)

matrix[1,2] = 0.5

matrix[0,0] = 1.1

matrix[2,3] = 0.7





