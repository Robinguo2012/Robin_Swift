//
//  main.swift
//  Swift11_继承
//
//  Created by sks on 16/6/2.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

// 继承
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        // do nothing
    }
    
}

let someVehicle = Vehicle()
someVehicle.makeNoise()

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true

bicycle.currentSpeed = 15.00

print("bicycle: \(bicycle.description)")

// 重写
/*
 当你在子类中重写超类的方法，属性或下标时，有时在你的重写版本中使用已经存在的超类实现会大有裨益。比如，你可以完善已有实现的行为，或在一个继承来的变量中存储一个修改过的值。
 */

// 重写方法
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

// 重写属性
/*
 如果你在重写属性中提供了 setter，那么你也一定要提供 getter。如果你不想在重写版本中的 getter 里修改继承来的属性值，你可以直接通过super.someProperty来返回继承来的值，其中someProperty是你要重写的属性的名字
 
 你可以将一个继承来的只读属性重写为一个读写属性，只需要在重写版本的属性里提供 getter 和 setter 即可。但是，你不可以将一个继承来的读写属性重写为一个只读属性
 */

class Car: Vehicle {
    var gear = 1
    override var description: String{
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 20.0
print("car: \(car.description)")

// 重写属性观察器 (Property Observer)
/*
 你不可以为继承来的常量存储型属性或继承来的只读计算型属性添加属性观察器。这些属性的值是不可以被设置的，所以，为它们提供willSet或didSet实现是不恰当。
 此外还要注意，你不可以同时提供重写的 setter 和重写的属性观察器。如果你想观察属性值的变化，并且你已经为那个属性提供了定制的 setter，那么你在 setter 中就可以观察到任何值变化了
 */
class AutomaticCar: Car {
    override var currentSpeed: Double{
        didSet{
            gear = Int(currentSpeed/10.0) + 1
        }
    }
}

let autoCar = AutomaticCar()
autoCar.currentSpeed = 35.0
print("autoCar: \(autoCar.description)")



