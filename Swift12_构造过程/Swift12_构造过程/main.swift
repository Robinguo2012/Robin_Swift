//
//  main.swift
//  Swift12_构造过程
//
//  Created by sks on 16/6/2.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

struct Fahrenheit {
    var temprature:Double
    
    init() {
        temprature = 32.0
    }
}

let f = Fahrenheit()

struct Celsius {
    var tempratureInCelsius: Double
    
    init(FromFahrenheit fahrenheit: Double){
        tempratureInCelsius = (fahrenheit - 32)/1.8
    }
    
    init(FromKelvin kelvin:Double){
        tempratureInCelsius = kelvin - 273.15
    }
    
    init(_ celsius: Double){
        tempratureInCelsius = celsius
    }
}

let boilingOfWater = Celsius(FromFahrenheit:212)
let freezingOfWater = Celsius(FromKelvin: 273.15)

let celius = Celsius(37.0)


struct color {
    let red,green,blue: Double
    
    init(red: Double,green: Double,blue: Double){
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double){
        red = white
        blue = white
        green = white
    }
}

let mengta = color(red: 1.0, green: 0.0, blue: 1.0)
let white = color(white: 1.0)

// 值类型 代理构造器
struct Point{
    var x = 0.0,y = 0.0
}

struct Size {
    var width = 0.0,height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size){
        self.origin = origin
        self.size = size;
    }
    
    init(center: Point, size: Size){
        let originX = center.x - size.width/2
        let originY = center.y - size.height/2
        self.init(origin: Point(x: originX, y: originY),size: size)
    }
}

// 类的继承和构造过程





        