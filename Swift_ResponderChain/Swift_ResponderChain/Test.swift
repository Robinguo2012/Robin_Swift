//
//  Test.swift
//  Swift_ResponderChain
//
//  Created by sks on 16/8/3.
//  Copyright © 2016年 sks. All rights reserved.
//

import UIKit

class Test: UIView {
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
//    init(){
//        super.init()
//        self.layer.cornerRadius = 100;
//        self.clipsToBounds = true
//    }
    
    var obserview:UIViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 100;
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        let alert = UIAlertView(title: "提示", message: "测试PointInside", delegate: nil, cancelButtonTitle: nil, otherButtonTitles: nil)
        
        let alert = UIAlertController(title: "提示", message: "", preferredStyle: .Alert)
        
//        alert.addAction(UIAlertAction(title: "确定", style: .Default, handler: { () in
//            
//        })
        //alert.addAction(<#T##action: UIAlertAction##UIAlertAction#>)
        let defaultAction = UIAlertAction(title: "确定", style: .Default) { (action: UIAlertAction) in
            print("点击完成");
        }
        alert.addAction(defaultAction)
        obserview?.presentViewController(alert, animated: true, completion: {
            () -> Void in
            
            print("跳转完成")
            
            })
    }

    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        
//        let arr = event?.allTouches()
//        let <#name#> = <#value#>
        
        return super.hitTest(point, withEvent: event)
    }
    
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        
        let path = UIBezierPath(ovalInRect: CGRectMake(0, 0, 200, 200))
        return path.containsPoint(point)
    }
}
