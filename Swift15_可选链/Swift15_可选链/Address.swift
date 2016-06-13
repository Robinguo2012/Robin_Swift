//
//  Address.swift
//  Swift15_可选链
//
//  Created by sks on 16/6/12.
//  Copyright © 2016年 sks. All rights reserved.
//

class Address {

    var buildingName: String?
    var buildNumber : String?
    var street: String?
    
    func buildIdentifier() -> String? {
        if buildingName != nil{
            return buildingName
        }else if buildNumber != nil && street != nil{
            return "\(buildNumber) \(street)"
        }else{
            return nil
        }
    }
}

