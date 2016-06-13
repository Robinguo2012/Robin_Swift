//
//  Country.swift
//  Swift14_自动引用计数
//
//  Created by sks on 16/6/8.
//  Copyright © 2016年 sks. All rights reserved.
//


class Country {

    let name:String
    var capitalCity: City!
    
    init(name: String,capitalCityName: String){
        self.name = name
        self.capitalCity = City(name: capitalCityName, country: self)
    }
}
