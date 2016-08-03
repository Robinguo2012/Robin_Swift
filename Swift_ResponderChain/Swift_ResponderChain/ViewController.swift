//
//  ViewController.swift
//  Swift_ResponderChain
//
//  Created by sks on 16/8/3.
//  Copyright © 2016年 sks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //let btn:UIButton = UIButton.buttonWithType(UIButtonType.ContactAdd)
        //var btn = UIButton().buttonType(UIButtonType.Custom)
//        let btn:UIButton = UIButton().buttonType(.Custome)
///        let btn:UIButton = UIButton(type:.ContactAdd)
        let btn:UIButton = UIButton(type: .Custom)
//        btn.backgroundColor(UIColor:redColor())
        btn.backgroundColor = UIColor.redColor()
        btn.frame = CGRectMake(100, 100, 100, 40)
        btn.addTarget(self, action: #selector(ViewController.btnClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func btnClick(sender: AnyObject){
//        print("click")
        let btn = sender as! UIButton
        var next = btn.nextResponder()
        var prefix = ""
        while (next != nil) {
            print("\(prefix) \(next?.classForCoder)")
            prefix += "--"
            next = next?.nextResponder()
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }

}

extension ViewController{
    
}

