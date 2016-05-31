//
//  main.swift
//  Swift08_属性
//
//  Created by sks on 16/5/31.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

// 存储属性
struct FixedLengthRange {
    var firstValue: Int
    let length:Int
}

// 结构体属于值类型, 值类型被声明为常量是,他的属性也是常量,即使属性被声明为变量也不可以修改
// 引用类型则不同
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)

//延迟存储属性 
/*
 延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。在属性声明前使用 lazy 来标示一个延迟存储属性。
 必须 是一个变量 (var)
 
 **如果一个被标记为 lazy 的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始化一次
 */

class DataImporter {
    
    /*
     DataImporter 是一个负责将外部文件中的数据导入的类。
     这个类的初始化会消耗不少时间。
     */
    
    var fileName = "data.txt"
    /*
     负责数据的导入功能
     */
}

class DataManager {
    lazy var importer = DataImporter()
    var data = String()
    /*
     数据的管理
     */
}

//计算属性
struct Point {
    var x = 0.0,y = 0.0
}

struct Size {
    var width = 0.0,height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get{
            let centerX = origin.x + size.width/2
            let centerY = origin.y + size.height/2
            return Point(x: centerX, y: centerY)
        }
        set{ // 也可以自己定义一个参数名
            origin.x = newValue.x - size.width/2
            origin.y = newValue.y - size.height/2
        }
    }
}

// 只读计算属性
/*
 没有setter 只有getter (必须是变量)
 */
struct Cubiod {
    var width = 0.0,height = 0.0,depth = 0.0
    var volume :Double{
        return width * height * depth
    }
}

// 属性观察器
class StepCounter {
    var totalSteps: Int = 0{
        willSet{
            print("About to step totalSteps \(newValue)")
        }
        
        didSet{
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue)")
            }
        }
    }
}

let stepCounter = StepCounter()

stepCounter.totalSteps = 200

stepCounter.totalSteps = 300

stepCounter.totalSteps = 600

// 类型属性
/*
 也可以为类型本身定义属性，无论创建了多少个该类型的实例，这些属性都只有唯一一份。这种属性就是类型属性。
 ** 1 一个必须给初始值的变量
    2 存储类型是延迟初始化的,即使是多线程访问,不必用lazy修饰
 */

struct SomeStruct {
    static var someProperty = "SomeValue."
    static var someComputedProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var someValue = "someValue."
    static var someComputedProperty: Int {
        return 6
    }
}

class SomeClass {
    static var someValue = "someValue."
    static var someComputedProperty: Int {
        return 10
    }
    
    class var overrideableComputedProperty:Int {
        return 27
    }
}

// 获取和设置类型属性的值
print(SomeStruct.someProperty)
SomeStruct.someProperty = "Another Value"
print(SomeStruct.someProperty)


// 立体声模拟
struct AudioChannel {
    static let threholdLevels = 10
    static var maxInputLevelForAllChannel = 0
    
    var currentLevel: Int = 0 {
        willSet {
            
        }
        
        didSet {
            if currentLevel >  AudioChannel.threholdLevels{
                currentLevel = AudioChannel.threholdLevels
            }
            
            if currentLevel > AudioChannel.maxInputLevelForAllChannel {
                AudioChannel.maxInputLevelForAllChannel = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel(currentLevel: 9)






