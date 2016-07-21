//
//  ViewController.swift
//  GCD_01
//
//  Created by sks on 16/7/18.
//  Copyright © 2016年 sks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        // 线程 : 
//        // 同步 异步 (同步和异步的主要区别在于是否会阻塞当前线程)
//        /*
//         *并行队列 串行队列 
//         *(都是FIFO 一个个取出来放到线程中执行,
//         *区别:串行是放在同一个线程中,前一个任务完了才执行下一个
//         *    并行队列是取出一个任务放到一个新的线程里,然后再取出来一个又放到另一个的线程。这样由于取的动作很快，忽略不计，看起来，所有的任务都是一起执行的,不过也受计算机资源的限制
//         *
//         */
//        
//        // 线程的阻塞
//        let queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_SERIAL)
//        
//        print("之前 - \(NSThread.currentThread())")
//        
//        dispatch_async(queue) { 
//         
//            print("sync 之前 \(NSThread.currentThread())")
//            dispatch_sync(queue, { 
//                
//                print("sync \(NSThread.currentThread())")
//            })
//
//            print("sync 之后 \(NSThread.currentThread())")
//        }
//        
//        print("之后 \(NSThread.currentThread())")
//        
//        /*
//         队列组可以将很多队列添加到一个组里，这样做的好处是，当这个组里所有的任务都执行完了，队列组会通过一个方法通知我们。下面是使用方法，这是一个很实用的功能。
//         
//         */
//        // 1 创建组
//        let group = dispatch_group_create()
//        
//        // 2.创建队列
//        let groupQueue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_SERIAL)
//        
//        // 3.多次使用队列组的方法执行任务,只有异步任务
//        // 3.1 执行3次循环
//        dispatch_group_async(group, groupQueue) {
//            
//            for _ in 0..<3 {
//                print("group-01 \(NSThread.currentThread())")
//            }
//        }
//        
//        //3.2 主队列执行8此循环
//        dispatch_group_async(group, dispatch_get_main_queue()) { 
//            
//            for _ in 0..<8 {
//                print("group-02 \(NSThread.currentThread())")
//            }
//        }
//        
//        // 3.3 执行5次循环
//        dispatch_group_async(group, groupQueue) { 
//            
//            for _ in 0..<5 {
//                print("group-03 \(NSThread.currentThread())")
//            }
//        }
//        
//        // 4 都完成后会自动通知
//        dispatch_group_notify(group, dispatch_get_main_queue(), {() -> Void in
//            print("group 中的任务执行完成");
//        })
//        
//        /*
//         * 二 : NSOperation NSOperationQueue 对应GCD中的任务和队列
//         NSInvocationOperation 不是类型安全的类 在swift中已经被废弃
//         */
//        let operation = NSBlockOperation{ () -> Void in
//            print("nsoperation \(NSThread.currentThread())")
//        }
//        
//        // 添加多个block
//        for index in 1..<5 {
//            operation.addExecutionBlock{ () -> Void in
//                print("第 \(index) 次")
//            }
//        }
//        
//        operation.start()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

