//
//  InheritProtocol.swift
//  Swift20_协议
//
//  Created by sks on 16/7/26.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

//protocol PrettyTextRepresentable: TextRepresentable {
//    var PrettyTextualDescription: String {get}
//}

protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

// 类类型专属协议
protocol someClassOnlyProtocol: class,TextRepresentable {
    
}