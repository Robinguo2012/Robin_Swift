//
//  ViewController.swift
//  Swift20_协议
//
//  Created by sks on 16/7/26.
//  Copyright © 2016年 sks. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,someProtocol {

    var mustBesettable:Int = 0
    var doesnotBesettable: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
        
        for _ in 1...5 {
            print("Random dice roll \(d6.roll())")
        }
        
        let game = SnakesAndLadders()
        let tracker = DiceGameTracker()
        
        game.delegate = tracker
        game.play()

        let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
        print(d12.textualDescription)
        
        print(game.textualDescription)
        
        let hamster = Hamster(name: "Robin")
        print(hamster.textualDescription)
        let somethingTextRepresent: TextRepresentable = hamster
        
        print(somethingTextRepresent.textualDescription)
        
        // 协议类型的集合
        /*
         * 可以同时继承多个协议
         */
        let things: [TextRepresentable] = [game,hamster,d12]
        
        for thing in things {
            print(thing.textualDescription)
        }
        
        // 协议的继承
        print(game.prettyTextualDescription)
        
        // 合成协议
        /*
         协议合成并不会生成新的、永久的协议类型，而是将多个协议中的要求合成到一个只在局部作用域有效的临时协议中。
         */
        struct person: named,aged{
            var name: String
            var age: Int
        }
        
        func wishHappyBirthday(celebrator: protocol<named,aged>){
            print("Happy birthday \(celebrator.name) for your \(celebrator.age) years old")
        }
        
        let per = person(name: "congye",age: 28)
        
        wishHappyBirthday(per)
        
        //检查协议的一致性
        /*
         is 用来检查实例是否符合某个协议，若符合则返回 true，否则返回 false。
         as? 返回一个可选值，当实例符合某个协议时，返回类型为协议类型的可选值，否则返回 nil。
         as! 将实例强制向下转换到某个协议类型，如果强转失败，会引发运行时错误。
        */
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 10
        return 20
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



