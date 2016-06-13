//
//  Residence.swift
//  Swift15_可选链
//
//  Created by sks on 16/6/12.
//  Copyright © 2016年 sks. All rights reserved.
//

//import UIKit

class Residence {
    var rooms = [Room]()
    
    var numbersOfRooms: Int{
        return rooms.count
    }
    
    subscript(i: Int) -> Room{
        
        get{
            return rooms[i]
        }
        
        set{
            return rooms[i] = newValue
        }
    }
    
    func printNumberOfRoom(){
        print("the numbers of rooms is \(numbersOfRooms)")
    }
    var address:Address?
    
}
