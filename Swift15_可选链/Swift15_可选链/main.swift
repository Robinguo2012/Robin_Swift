//
//  main.swift
//  Swift15_可选链
//
//  Created by sks on 16/6/12.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation


class Person {
    var residence: Residence?
}

let john = Person()



//let rooms = john.residence!.numbersOfRooms 引起运行时错误

if let rooms = john.residence?.numbersOfRooms{
    print("John's residence has \(rooms)")
}else{
    print("Unable retrieve the numbers of rooms")
}




//print("rooms is \(rooms)")

