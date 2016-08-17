//
//  ViewController.swift
//  Swift_ResponderChain
//
//  Created by sks on 16/8/3.
//  Copyright © 2016年 sks. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let rect = CGRectMake(100, 200, 200, 200)
        
        let tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        let view = Test(frame: rect)
        view.obserview = self
        view.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(view)
                
        // btn
        let btn:UIButton = UIButton(type: .Custom)
        btn.backgroundColor = UIColor.redColor()
        btn.frame = CGRectMake(100, 100, 100, 40)
        btn.addTarget(self, action: #selector(ViewController.btnClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(btn)
    }
    
    //MARK: T
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func btnClick(sender: AnyObject){
        let btn = sender as! UIButton
        var next = btn.nextResponder()
        var prefix = ""
        while (next != nil) {
            print("\(prefix) \(next?.classForCoder)")
            prefix += "--"
            next = next?.nextResponder()
        }
    }
    
    // 点击手势
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print(touches)
        let touch = touches.first
        let point = touch?.locationInView(view)
        print(point)
        //let te = touches.generate().next()
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        
    }
    
    // 移动手势
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
    }
    
    override func motionCancelled(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
    }
    
    // 远程控制手势
    override func remoteControlReceivedWithEvent(event: UIEvent?) {
        
    }
    
    // 按压手势
    override func pressesBegan(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        
    }
    
    override func pressesChanged(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        
    }
    
    override func pressesEnded(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        
    }
    
    override func pressesCancelled(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        
    }
    
}

extension ViewController{
    
}

