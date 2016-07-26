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
        
        
        var d6 = Dice(sides: 6, generator: MethodProtocol())
        
        for _ in 1...5 {
            print("Random dice roll \(d6.roll)")
            
        }
        
    
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



