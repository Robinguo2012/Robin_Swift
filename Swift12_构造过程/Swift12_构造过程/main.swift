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
/*
 为了简化指定构造器和便利构造器之间的调用关系，Swift 采用以下三条规则来限制构造器之间的代理调用：
 
 规则 1
 
 指定构造器必须调用其直接父类的的指定构造器。
 
 规则 2
 
 便利构造器必须调用同一类中定义的其它构造器。
 
 规则 3
 
 便利构造器必须最终导致一个指定构造器被调用。
 
 一个更方便记忆的方法是：
 
 指定构造器必须总是向上代理
 便利构造器必须总是横向代理
 
 */

// 构造器的继承和重写
// 构造器的自动继承
class Food {
    var name: String
    init(name: String){
        self.name = name
    }
    
    convenience init(){
        self.init(name:"[Unnamed]")
    }
}

let nameMeat = Food(name: "Bacon")

let mysteryMeat = Food()

class RecipeIngredient: Food {
    var quantity:Int
    
    init(name: String,quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name,quantity: 1)
    }
}

// 可失败构造器 init?
struct Animal {
    let species: String
    init?(species:String){
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}

let someCreature = Animal(species: "")

if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}else{
    print("animal was initialized to nil")
}

// 可失败构造器 init!
/*
 你可以在init?中代理到init!，反之亦然。你也可以用init?重写init!，反之亦然。你还可以用init代理到init!，不过，一旦init!构造失败，则会触发一个断言。
 */

// 必要构造器
/*
 如果子类继承的构造器能满足必要构造器的要求，则无须在子类中显式提供必要构造器的实现。
 */
//class Meat: Food {
//    required init() {
//        // 构造器的实现代码
//    }
//}

// 通过闭包或函数设置属性的默认值
struct Checkboard {
    
    let boardColor: [Bool] = {
       var temporaryBoard = [Bool]()
       var isBlack = false
        for i in 1...8{
            for j in 1...8{
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            
            isBlack = !isBlack
        }
        
        return temporaryBoard
    }()
    
    func squareIsBlackAtRow(row: Int,column: Int) -> Bool {
        return boardColor[row * 8 + column]
    }
}

let board = Checkboard()

print(board.squareIsBlackAtRow(6, column: 6))








        