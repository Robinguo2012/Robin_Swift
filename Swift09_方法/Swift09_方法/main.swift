//
//  main.swift
//  Swift09_方法
//
//  Created by sks on 16/5/31.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation


class Counter {
    var count = 0
    
    func increment() {
        count += 1
    }
    
    func incrementBy(amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.incrementBy(5)
counter.reset()

// 在实例方法中修改值类型
/*
 结构体和枚举是值类型。默认情况下，值类型的属性不能在它的实例方法中被修改
 这种方法只会改变以前的结构体,没有生成一个新的结构体
 */
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveByX(delatX:Double , y delatY:Double) {
        x += delatX
        y += delatY
    }
}

var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveByX(2.0, y: 3.0)

print("the point is now at \(somePoint.x) \(somePoint.y)")

// 会生成一个全新实例
struct Point0 {
    var x = 0.0 , y = 0.0
    mutating func moveByX(delatX : Double , delatY : Double){
        self = Point0(x: x+delatX, y: y+delatY)
    }
}

enum TriSwitchState {
    case Off,Low,High
    mutating func next() {
    
        switch self {
        case .Off:
            self = Low
        case .Low:
            self = High
        case .High:
            self = Off
        }
    }
}

var ovenLight = TriSwitchState.High
ovenLight.next()

// 类型方法 Type Methods
/*
 在方法的func关键字之前加上关键字static，来指定类型方法。类还可以用关键字class来允许子类重写父类的方法实现
 */
class someClass {
    
    class func someTypeFunc() {
        print("调用一个类型方法")
    }
}

someClass.someTypeFunc()

// 模拟一个游戏中的玩家
struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockedLevel(level: Int){
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func levelIsUnlocked(level: Int) -> Bool{
        return level <= highestUnlockedLevel
    }
    
    var currentLevel = 1
    mutating func advanceToLevel(level: Int) -> Bool{
        
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel = level
            return true
        }else{
            return false
        }
    }
    
}

class Player {
    var tracker = LevelTracker()
    let playerName:String
    
    func completedLevel(level:Int) {
        
        LevelTracker.unlockedLevel(level+1)
        tracker.advanceToLevel(level + 1)
    }
    
    init(name:String){
        playerName = name
    }
    
}

var player_0 = Player(name: "Argyrios")
player_0.completedLevel(1)

var player_1 = Player(name: "Beto")

player_1.completedLevel(6)

if player_1.tracker.advanceToLevel(6){
    print("player is now on level 6")
}else{
    print("level 6 has not yet been locked")
}

class someSubClass: someClass {
    class override func someTypeFunc(){
        
        print("重写了一个类型方法")
    }
}

someSubClass.someTypeFunc()
        