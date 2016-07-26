//
//  main.swift
//  Swift18_嵌套类型
//
//  Created by sks on 16/7/25.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation


struct BlackjackCard {
    // 嵌套的 suit 枚举
    enum Suit:Character {
        case Spades = "♠", Hearts = "♡", Diamonds = "♢", Clubs = "♣"
    }
    
    enum Rank: Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine
        case Jack, Queue, King, Ace
        
        struct Values {
            let first: Int, second: Int?
        }
        
        var values:Values {
            
            switch self {
            case .Ace:
                return Values(first: 1, second: 11)
            case .Jack, .Queue, .King:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
        
    }
    // BlackjackCard 的属性和用法
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        
        return output
    }
    
}

let theAceSpades = BlackjackCard(rank: .Ace, suit: .Spades)
print("theAceSpades: \(theAceSpades.description)")


