//
//  City.swift
//  Swift14_自动引用计数
//
//  Created by sks on 16/6/8.
//  Copyright © 2016年 sks. All rights reserved.
//

class City {

    let name:String
    unowned let country:Country
    init(name: String, country: Country){
        self.name = name
        self.country = country
    }
}
