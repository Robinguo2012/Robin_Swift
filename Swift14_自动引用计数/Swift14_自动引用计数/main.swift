//
//  main.swift
//  Swift14_自动引用计数
//
//  Created by sks on 16/6/7.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

//print("Hello, World!")
class Person {
    let name: String
    init(name: String){
        self.name = name;
        print("\(name) is being initialized")
    }
    var apartment: Apartment?
    
    deinit{
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "Jhon")
reference2 = reference1
reference3 = reference1

/*
 这个Person的实例有3个强引用了
 */
reference1 = nil
reference2 = nil

// 不会释放
reference3 = nil

// 类实例间的循环强引用
var Robin: Person?
var unit: Apartment?

Robin = Person(name: "robin")
unit = Apartment(unit: "xisanqi")

Robin!.apartment = unit
unit!.person = Robin

Robin = nil
unit = nil
/*
 Swift 提供了两种办法用来解决你在使用类的属性时所遇到的循环强引用问题：弱引用（weak reference）和无主引用（unowned reference）。
 在实例的生命周期中，如果某些时候引用没有值，那么弱引用可以避免循环强引用。如果引用总是有值，则可以使用无主引用，在无主引用中有描述
 */

// 弱引用
/*
 弱引用必须被声明为变量，表明其值能在运行时被修改。弱引用不能被声明为常量。
 */

var json:Customer?
json = Customer(name: "json")
//let creditCard = CreditCard(num: 123456789, customer: json!)
//<<<<<<< HEAD
////json!.creditCard = creditCard
//json!.creditCard = CreditCard(num: 1232432424234, customer: json!)
//=======
json!.creditCard = CreditCard(num: 1234567, customer: json!)

//>>>>>>> d3f479e66fc0e079e9126d4321c1aeccd861abce

json = nil

var contry = Country(name: "Canada", capitalCityName: "Ottawa")




