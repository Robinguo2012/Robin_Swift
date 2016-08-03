//
//  OptionalProtocol.swift
//  Swift20_协议
//
//  Created by sks on 16/7/27.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

@objc protocol CounterDataSource {
    optional func incrementForCounter(counter: Int) -> Int
    optional var fixedIncrement: Int { get }
}