//
//  ViewController.swift
//  Swift21_泛型
//
//  Created by sks on 16/7/27.
//  Copyright © 2016年 sks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 泛型编程
        
        var str_a = "hello"
        var str_b = "world"
        
        self.swapTwoValues(&str_a, b: &str_b)
        
        print("str_a: \(str_a) \n str_b: \(str_b)")
        
        var stackOfStrings = Stack<String>()
        stackOfStrings.push("1")
        stackOfStrings.push("2")
        stackOfStrings.push("3")
        stackOfStrings.push("4")
        
        let fromTop = stackOfStrings.pop()
        
        print(fromTop)
        
        // 类型约束
        /*
         不过，有的时候如果能将使用在泛型函数和泛型类型中的类型添加一个特定的类型约束，将会是非常有用的。类型约束可以指定一个类型参数必须继承自指定类，或者符合一个特定的协议或协议组合。
         */
        
        // 关联类型
        /*
         关联类型为协议中的某个类型提供了一个占位名（或者说别名），其代表的实际类型在协议被采纳时才会被指定。你可以通过 associatedtype 关键字来指定关联类型。
         */
        
        let arrayOfStrings = ["1","2","3"]
        var stackOfStrings0 = Stack<String>()
        stackOfStrings0.push("1")
        stackOfStrings0.push("2")
        stackOfStrings0.push("3")
        
        let isEqual = allItemMatch(stackOfStrings0, anotherContainer: arrayOfStrings)
        
        print(isEqual)
        
        
    }
    
    //类型约束实践
    func findValueFor<T: Equatable> (array: [T] , _valueTofind: T) -> Int?{
        for (index, value) in array.enumerate() {
            if value == _valueTofind {
                return index
            }
        }
        return nil
    }
    
    // 如果要交换两个字符串或者其他对象还得另写方法
    func swapTwoInts(inout a: Int, inout b: Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    //泛型函数
    func swapTwoValues <T> (inout a: T, inout b: T) {
        let temporary = a
        a = b
        b = temporary
    }
    
    // 类型约束的语法
    func someFunction <T: Test , U: Hashable> (someT: T,someU: U) {
        
        
    }
    
    // 使用 where 子句
    func allItemMatch <C1: Container, C2: Container where C1.ItemType == C2.ItemType, C1.ItemType: Equatable> (someContainer: C1, anotherContainer: C2) -> Bool{
        
        // 检查两个容器个数是否相等
        if someContainer.count != anotherContainer.count {
            return false
        }
        
        // 检查每一个元素是否相等
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        
        return true
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// 泛型类型
struct IntStack {
    
    var items = [Int]()
    
    mutating func push(item: Int){
        items.append(item)
    }
    
    mutating func pop() -> Int{
        return items.removeLast()
    }
}

// 关联类型
struct Stack <Element> : Container{
    var items = [Element]()
    
    mutating func push(item: Element){
        items.append(item)
    }
    
    mutating func pop() -> Element{
        return items.removeLast()
    }
    
    // Container protocol
    mutating func append(item: Element) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(index: Int) -> Element{
        return items[index]
    }
    
}

extension Array: Container {}
