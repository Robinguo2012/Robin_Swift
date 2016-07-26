//
//  DiceGameTracker.swift
//  Swift20_协议
//
//  Created by sks on 16/7/26.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

class DiceGameTracker: DiceGameDelegate {
    var numbersOfTurns = 0
    
    func gameDidStart(game: DiceGame) {
        numbersOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using \(game.dice.sides) - side dice")
    }
    
    func game(game: DiceGame, didStartNewTurnWithDiceRoll didDiceRoll: Int) {
        
        numbersOfTurns += 1
        print("Rolled a \(didDiceRoll)")
    }
    
    func gameDidEnd(game: DiceGame) {
        print("the game last \(numbersOfTurns) turns")
    }
}
