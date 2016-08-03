//
//  TowardsZeroSource.swift
//  Swift20_协议
//
//  Created by sks on 16/7/27.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

@objc class TowardsZeroSource: NSObject,CounterDataSource {

    func incrementForCounter(counter: Int) -> Int {
        
        if counter == 0 {
            return 0
        }else if counter < 0{
            return 1
        }else{
            return -1
        }
    }
}
