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
        
        
        /*
         dispatch_barrier_async
         *我们先将一个9初始化到NSUserDefaults的Integer_Key中，然后在中间执行dispatch_barrier_async函数，由于这个队列是一个Concurrent Dispatch Queue，能同时并发多少线程是由系统决定的，如果添加dispatch_barrier_async的时候，其他的block（包括上面4个block）还没有开始执行，那么会先执行dispatch_barrier_async里的任务，其他block全部处于等待状态。如果添加dispatch_barrier_async的时候，已经有block在执行了，那么dispatch_barrier_async会等这些block执行完后再执行。
         */
        NSUserDefaults.standardUserDefaults().setInteger(9, forKey: "Integer_key")
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            () -> Void in
            self.readFile();
        })
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            () -> Void in
            self.readFile();
        })
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            () -> Void in
            self.readFile();
        })
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            () -> Void in
            self.readFile();
        })
        
        dispatch_barrier_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            () -> Void in
            self.writeFile()
        })
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            () -> Void in
            self.readFile();
        })
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            () -> Void in
            self.readFile();
        })
        
        /*
         dispatch_apply
         dispatch_apply会将一个指定的block执行指定的次数。
         如果要对某个数组中的所有元素执行同样的block的时候，这个函数就显得很有用了，用法很简单，指定执行的次数以及Dispatch Queue，在block回调中会带一个索引，然后就可以根据这个索引来判断当前是对哪个元素进行操作
         */
        
        let globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

        
        dispatch_apply(10, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            (index) -> Void in
            print("\(index)")
        })
        
        print("completed")
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            () -> Void in
            dispatch_apply(10, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
               (index) -> Void in
                print("\(index)")
            })
        })
        
        print("completed again")
        /*
         * dispatch_suspend / dispatch_resume
         *
         *
         */
        dispatch_suspend(globalQueue) //暂停一个队列
        dispatch_resume(globalQueue)  //恢复一个队列
        
        // dispatch_semaphore 信号量
        let semaphore = dispatch_semaphore_create(1)
        let time = dispatch_time(DISPATCH_TIME_NOW,  (Int64)(3 * NSEC_PER_SEC))
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            () -> Void in
            
            dispatch_semaphore_wait(semaphore, time)
            
            print("需要线程同步的操作1开始")
            sleep(2)
            print("需要线程同步的操作1结束")
        
            dispatch_semaphore_signal(semaphore)
        })
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            () -> Void in
            
            sleep(1);
            dispatch_semaphore_wait(semaphore, time)
            print("需要线程同步的操作2")
            dispatch_semaphore_signal(semaphore)
        })
        
        let semaphore1 = dispatch_semaphore_create(1)
        
        for _ in 1...9 {
            
            dispatch_async(globalQueue, {
            () -> Void in
                dispatch_semaphore_wait(semaphore1, DISPATCH_TIME_FOREVER)
                
                let time1 = dispatch_time(DISPATCH_TIME_NOW, (Int64)(NSEC_PER_SEC * 2))
                
                dispatch_after(time1, globalQueue, {
                () -> Void in
                   print("2秒后执行")
                    dispatch_semaphore_signal(semaphore1)
                })
            })
        }
        
        let singletonObj = SingletonObject.sharedInstance
        
        singletonObj.name = "郭华斌"
        
        print("name is \(singletonObj.name)")
        
        let singleton1 = SingletonObject.sharedInstance
        
        singleton1.name = "从叶"
        
        print("name pre is \(singletonObj.name)")
        print("name is \(singleton1.name)")

        
    }
    
    
    func writeFile() {
        NSUserDefaults.standardUserDefaults().setInteger(7, forKey: "Integer_key")
    }
    
    func readFile()  {
        NSUserDefaults.standardUserDefaults().integerForKey("Integer_key")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class SingletonObject {
    var name:String = ""
    var age = 10
    
    class var sharedInstance: SingletonObject{
        
        struct Struct {
            static var once_token: dispatch_once_t = 0
            static var instance: SingletonObject? = nil
        }
        
        dispatch_once(&Struct.once_token){
            Struct.instance = SingletonObject()
        }
        
        return Struct.instance!
    }
}

