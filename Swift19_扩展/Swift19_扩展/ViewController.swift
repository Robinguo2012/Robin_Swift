//
//  ViewController.swift
//  Swift19_扩展
//
//  Created by sks on 16/7/25.
//  Copyright © 2016年 sks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var name:String = ""

//    init(name: String){
//        self.name = name
//        super.init(name:name)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Swift 中的扩展
        /*
         1.添加计算型属性和计算类型属性
         2.定义实例化方法和类型方法
         3.提供新的构造器
         4.定义下标
         5.定义和使用新的嵌套类型
         6.使一个已有的类型符合某种协议
         */
        
        /*
         ** 扩展可以添加新的计算型属性，但是不可以添加存储型属性，也不可以为已有属性添加属性观察器。
         ** 扩展可以为一个类型添加新的功能,但不能重新自己的功能*/
        //
        let oneInch = 25.4.mm
        print("One Inch is \(oneInch) meters")
        
        3.repetitions {
            print("hello world")
        }
        
        var someInt = 4
        someInt.square()
        print("someInt: \(someInt)")

        print("another int: \(438384[1])")
        
        printIntegerKinds([9,0,-22,8,-3])
        
    }
    
//    init(name: String){
//        self.title = name
////        super.init(name: name)
//    }

    //    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    func printIntegerKinds(numbers:[Int]) {
        
        for number in numbers {
            switch number.kind {
            case .Negative:
                print("-",terminator: " ")
            case .Positive:
                print("+",terminator: " ")
                
            default:
                print("0",terminator: " ")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController{
    //扩展
//    convenience init(testExtension: String){
//        print("调用\(testExtension)")
//    }
}

