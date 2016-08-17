//
//  ViewController.swift
//  OC_Swift
//
//  Created by sks on 16/7/26.
//  Copyright © 2016年 sks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let tableView = UITableView.init(frame: CGRectZero, style: <#T##UITableViewStyle#>)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        MyTestClass.classForCoder()
        //        let test = Test()
//        test.name = "guo"
//        print(test.name)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

