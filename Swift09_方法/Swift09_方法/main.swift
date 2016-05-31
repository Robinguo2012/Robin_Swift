//
//  main.swift
//  Swift09_方法
//
//  Created by sks on 16/5/31.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation


class Counter {
    var count = 0
    
    func increment() {
        count += 1
    }
    
    func incrementBy(amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.incrementBy(5)
counter.reset()

        