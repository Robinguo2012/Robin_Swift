//
//  TextRepresentable.swift
//  Swift20_协议
//
//  Created by sks on 16/7/26.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

/*
 通过扩展添加协议一致性
 */
protocol TextRepresentable {
    var textualDescription: String {get}
}

//protocol PrettyTextRepresentabel: TextRepresentable {
//    var prettyTextualDescription: String {get}
//}