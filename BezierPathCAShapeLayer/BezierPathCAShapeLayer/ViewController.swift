//
//  ViewController.swift
//  BezierPathCAShapeLayer
//
//  Created by sks on 16/9/1.
//  Copyright © 2016年 sks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var layer:CAShapeLayer? = nil;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let startPoint = CGPointMake(50, 300)
        let controlPoint = CGPointMake(170, 200)
        let endPoint = CGPointMake(300, 300)
        
        let layer1 = CALayer()
        layer1.frame = CGRectMake(startPoint.x, startPoint.y, 5, 5)
        layer1.backgroundColor = UIColor.redColor().CGColor;
        
        let layer2 = CALayer()
        layer2.frame = CGRectMake(endPoint.x, endPoint.y, 5, 5)
        layer2.backgroundColor = UIColor.redColor().CGColor;
        
        let layer3 = CALayer()
        layer3.frame = CGRectMake(controlPoint.x, controlPoint.y, 5, 5)
        layer3.backgroundColor = UIColor.redColor().CGColor
        
        let path = UIBezierPath()
        path.moveToPoint(startPoint);
        path.addQuadCurveToPoint(endPoint, controlPoint: controlPoint)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.strokeColor = UIColor.blueColor().CGColor
        
        self.layer = shapeLayer
        
        self.view.layer.addSublayer(layer1)
        self.view.layer.addSublayer(layer2)
        self.view.layer.addSublayer(layer3)
        
        self.view.layer.addSublayer(shapeLayer)
        
//        self.animation1()
        self.animation2();
        self.animation3();
    }

    private func animation1(){
        let an = CABasicAnimation(keyPath: "strokeEnd")
        an.fromValue = 0.0
        an.toValue = 1.0
        an.duration = 2.0
        self.layer?.addAnimation(an, forKey: "")
    }
    
    private func animation2(){
        self.layer!.strokeStart = 0.5
        self.layer!.strokeEnd = 0.5
        
        let animation = CABasicAnimation(keyPath: "strokeStart")
        animation.fromValue = 0.5
        animation.toValue = 0
        animation.duration = 2
        
        let animation2 = CABasicAnimation(keyPath: "strokeEnd")
        animation2.fromValue = 0.5
        animation2.toValue = 1
        animation2.duration = 2
        
        self.layer!.addAnimation(animation, forKey: "")
        self.layer!.addAnimation(animation2, forKey: "")
    }
    
    private func animation3() {
        let animation = CABasicAnimation(keyPath: "lineWidth")
        animation.fromValue = 1
        animation.toValue = 10
        animation.duration = 2
        self.layer!.addAnimation(animation, forKey: "")
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        print("动画结束")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

