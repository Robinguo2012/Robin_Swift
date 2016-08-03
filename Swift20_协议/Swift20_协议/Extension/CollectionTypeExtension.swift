//
//  CollectionTypeExtension.swift
//  Swift20_协议
//
//  Created by sks on 16/7/27.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

//extension CollectionType where Generator.Element: TextRepresentable {
//    var textualDescription: String {
//        let itemsAsText = self.map { $0.textualDescription }
//        return "[" + itemsAsText.joinWithSeparator(", ") + "]"
//    }
//}

extension CollectionType where Generator.Element: TextRepresentable{
    
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joinWithSeparator(", ") + "]"
    }
    
}