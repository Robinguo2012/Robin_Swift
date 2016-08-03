//
//  Counter.swift
//  Swift20_协议
//
//  Created by sks on 16/7/27.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

class Counter: NSObject,CounterDataSource {

    var count = 0
    var dataSource: CounterDataSource?
    
    func increment()  {
        if let amount = dataSource?.incrementForCounter?(count) {
            count += amount
        }else if let amount = dataSource?.fixedIncrement{
            count += amount
        }
    }
    
}
