//
//  ViewController.swift
//  Swift20_协议
//
//  Created by sks on 16/7/26.
//  Copyright © 2016年 sks. All rights reserved.
//

import UIKit


class ViewController: UIViewController,someProtocol {

    var mustBesettable:Int = 0
    var doesnotBesettable: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tableView = UITableView.init(frame: CGRectZero, style: UITableViewStyle.Grouped)
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        
        tableView.registerClass(MyCell.self, forCellReuseIdentifier: "Cell")
        
        
        tableView.mas_makeConstraints( { (make) in
            make.top.mas_equalTo()(self.view).offset()(0)
            make.bottom.mas_equalTo()(self.view).offset()(0)
            make.left.mas_equalTo()(self.view).offset()(0)
            make.right.mas_equalTo()(self.view).offset()(0)
        })
        
//        tableView.mas_makeConstraints { (make) -> Void in
//            make.edges.mas_offset(UIEdgeInsetsMake(0, 0, 0, 0))
//        }
        
        
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
        
        let arr:[AnyObject] = [Circle(radius: 20),Country(area: 243_610),Animal(legs: 10)]
        
        for object in arr {
            if let objectArea = object as? HasArea {
                print("Area is \(objectArea.area)")
            }else{
                print("Something has no area")
            }
        }
        
        //可选的协议要求
        /*
         可选的协议要求只能用在标记 @objc 特性的协议中。
         该特性表示协议将暴露给 Objective-C 代码，详情参见Using Swift with Cocoa and Objective-C(Swift 2.2)。即使你不打算和 Objective-C 有什么交互，如果你想要指定可选的协议要求，那么还是要为协议加上 @objc 特性。
         还需要注意的是，标记 @objc 特性的协议只能被继承自 Objective-C 类的类或者 @objc 类采纳，其他类以及结构体和枚举均不能采纳这种协议
         */
        
        let counter = Counter()
        let threeSource = ThreeSource()
        counter.dataSource = threeSource
        
        
        for _ in 1...4 {
            counter.increment()
            print(counter.count)
        }
        
        let counter0 = Counter()
        let source0 = TowardsZeroSource()
        
        counter0.count = -4
        counter0.dataSource = source0
        
        for _ in 1...5 {
            counter0.increment()
            print(counter0.count)
        }
        
        // 协议扩展
        /*
         协议可以通过扩展来为采纳协议的类型提供属性、方法以及下标的实现。通过这种方式，你可以基于协议本身来实现这些功能，而无需在每个采纳协议的类型中都重复同样的实现，也无需使用全局函数。
         */
        let line = LinearCongruentialGenerator()
        print("Here is a random number \(line.random())")
        print("And here is a random bool \(line.randomBool())")
        
        // 提供默认实现
        /*
         可以通过协议扩展来为协议要求的属性、方法以及下标提供默认的实现。如果采纳协议的类型为这些要求提供了自己的实现，那么这些自定义实现将会替代扩展中的默认实现被使用
         */
        
        // 为协议扩展添加限制条件
        let murrayTheHamster = Hamster(name: "Murray")
        let morganTheHamster = Hamster(name: "Morgan")
        let mauriceTheHamster = Hamster(name: "Maurice")
        let hamsters = [murrayTheHamster, morganTheHamster, mauriceTheHamster]
        
        print(hamsters.textualDescription)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UITableViewDataSource{
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40.0
    }
}

extension ViewController: UITableViewDelegate{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        return cell
    }
}


