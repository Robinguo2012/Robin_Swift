//
//  CompoundProtocol.swift
//  Swift20_协议
//
//  Created by sks on 16/7/26.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

protocol named {
    var name: String {get}
}

protocol aged {
    var age: Int {get}
}