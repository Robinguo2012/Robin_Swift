//
//  main.swift
//  Swift13_析构过程
//
//  Created by sks on 16/6/7.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

//print("Hello, World!")
// 银行类
class Bank {
    static var coinsInBank = 10_000
    static func vendCoins(numbersOfCoinsRequested: Int) -> Int{
        let numbersOfCoinsToVend = min(numbersOfCoinsRequested, coinsInBank)
        coinsInBank -= numbersOfCoinsToVend
        return numbersOfCoinsToVend;
    }
    
    static func receiveCoins(coins: Int){
        coinsInBank += coins
    }
}

// 玩家类
class Player {
    
    var containInPurse: Int
    init(coins: Int){
        containInPurse = Bank.vendCoins(coins)
    }
    
    func winCoins(coins:Int) {
        containInPurse += Bank.vendCoins(coins)
    }
    
    deinit{
        Bank.receiveCoins(containInPurse)
    }
}

var playerOne:Player? = Player(coins: 100)
print("A new player has joined game with \(playerOne!.containInPurse) coins")

print("There are now \(Bank.coinsInBank) coins left in bank")

playerOne!.winCoins(2_000)

playerOne!.winCoins(100)

print("A player won 2000  now has \(playerOne!.containInPurse) coins")

print("There are now \(Bank.coinsInBank) coins left in bank")

playerOne = nil;

//print("A new player has joined game with \(playerOne!.containInPurse) coins")

print("There are now \(Bank.coinsInBank) coins left in bank")


