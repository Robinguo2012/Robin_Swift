//
//  NextVC.swift
//  BezierPathCAShapeLayer
//
//  Created by sks on 16/9/2.
//  Copyright © 2016年 sks. All rights reserved.
//

import UIKit

class NextVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var WxPullView:WXPullView? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView.init(frame: self.view.bounds, style: UITableViewStyle.Plain)

        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        self.WxPullView = WXPullView.init(frame: CGRectMake(CGFloat(CGRectGetWidth(self.view.frame)/2 - 25.0), -64, 50, 30))
//        self.WxPullView?.backgroundColor = UIColor.greenColor()
        tableView.addSubview(self.WxPullView!)
        
        self.view.backgroundColor = UIColor.blackColor()
        tableView.backgroundColor = UIColor.clearColor()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cell";
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellId)
        }
        cell?.backgroundColor = UIColor.blackColor()
        cell!.textLabel?.text = "郭华斌"
        return cell!
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.WxPullView?.animationWithY(scrollView.contentOffset.y)
    }
    
}


//extension ViewController: UITableViewDelegate{
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 20
//    }
//}
//
//extension ViewController: UITableViewDataSource{
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cellId")
//        cell.textLabel?.text = "Robin"
//        return cell;
//        
//    }
//    
//    
//}