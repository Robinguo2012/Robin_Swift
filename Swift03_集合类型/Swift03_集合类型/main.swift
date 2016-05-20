//
//  main.swift
//  Swift03_集合类型
//
//  Created by Robin Guo on 16/5/18.
//  Copyright © 2016年 Robin Guo. All rights reserved.
//

import Foundation

print("Hello, World!")

// 

let letArr = [123,321]

var mutableArr = [1,2,3]

var someInts = [Int]()
someInts.append(3)

var someDouble = [Double](count:3,repeatedValue:0.0)

print(someDouble)

var threeAnotherDouble = [Double](count:3,repeatedValue:2.5)

var sixDouble = threeAnotherDouble + someDouble

print(sixDouble)

// 用字面量构造数组
var shopList:[String] = ["Eggs","Mile"]

// 访问和修改数组
print("the shoplist contains \(shopList.count) item")

if shopList.isEmpty {
    print("the shoplist is empty")
}else{
    print("the shoplis is not empty")
}

shopList.append("Flour")

print(shopList)

shopList += ["HotDog","Cheese"]

print(shopList)

shopList[1...3] = ["Meat"]

print(shopList)

shopList.insert("Maple Syrup", atIndex: 0)

print(shopList)

shopList.removeAtIndex(0)

for (index,value) in shopList.enumerate(){
    print("Item \(index) : \(value)")
}

// 集合
var letters = Set<Character>()
letters.insert("a")

var favouriteGenres:Set<String> = ["Rock","Classical","Hip hop"]
print("I have \(favouriteGenres.count) favourite genres music")

if let removedGenres = favouriteGenres.remove("Rock") {
    print("\(removedGenres)? I'm over it")
}else{
    print("I never much cared for that.")
}

for genres in favouriteGenres {
    print("\(genres)")
}

let oddDigits:Set = [1,3,5,7,9]
let evenDigits:Set = [2,4,6,8,0]
let sigleDigitsNumber:Set = [2,3,5,7]

let unionSet = oddDigits.union(evenDigits).sort() // 并集
print(unionSet)

let interSet = oddDigits.intersect(sigleDigitsNumber).sort() // 交集
print(interSet)

let exclusiveOrSet = oddDigits.exclusiveOr(sigleDigitsNumber) // 非交集
print(exclusiveOrSet)

let subtractSet = oddDigits.subtract(sigleDigitsNumber).sort()
print(subtractSet)

let horseAnimals:Set = ["🐶","🐱"]
let farmAnimals:Set = ["🐮","🐔","🐑","🐶","🐱"]
let cityAnimals:Set = ["🐦","🐭"]

print(farmAnimals)

let bool0 = horseAnimals.isSubsetOf(farmAnimals)
let bool1 = farmAnimals.isSupersetOf(horseAnimals)
let bool2 = horseAnimals == farmAnimals ? true:false

// 字典
 // 创建一个空字典
var numbersOfInteger = [Int:String]()
numbersOfInteger[16] = "郭华兵"    // 赋值
numbersOfInteger = [:]            // 置空



var airports:[String:String] = ["YYZ":"Toronto Pearson","DUB":"Dublin"]
airports["LHR"] = "London Heathrow"

if let removedValue = airports.removeValueForKey("DUB"){
    print("Removed airport is \(removedValue)")
}else{
    print("the airports does not contain a value DUB")
}

//
for (key,value) in airports{
    print("\(key) for \(value)")
}

for airportCode in airports.keys{
    print("\(airportCode)")
}



        