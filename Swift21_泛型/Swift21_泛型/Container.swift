//
//  Container.swift
//  Swift21_泛型
//
//  Created by sks on 16/7/28.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

protocol Container {
    associatedtype ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(index: Int) -> ItemType {get}
    
}