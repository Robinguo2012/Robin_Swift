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

        self.animation4()
//        self.animation1()
//        self.animation2();
//        self.animation3();
        
        let btn = UIButton(type: .Custom)
        btn.frame = CGRectMake(100, 400, 80, 90)
        btn.backgroundColor = UIColor.greenColor()
        btn.addTarget(self, action: #selector(btnClick), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(btn)
    }
    
    @objc private func btnClick(btn: UIButton){
        let next = NextVC()
        self.navigationController?.pushViewController(next, animated: true)
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
    
    private func animation4() {
        
        self.layer!.strokeStart = 0.5
        self.layer!.strokeEnd = 0.5
        
        let animation1 = CABasicAnimation(keyPath: "strokeStart")
        animation1.fromValue = 0.5
        animation1.toValue = 0
        animation1.duration = 2
        animation1.fillMode = kCAFillModeForwards;
        animation1.removedOnCompletion = false

        
        let animation2 = CABasicAnimation(keyPath: "strokeEnd")
        animation2.fromValue = 0.5
        animation2.toValue = 1
        animation2.duration = 2
        animation2.fillMode = kCAFillModeForwards;
        animation2.removedOnCompletion = false

        
        self.layer!.addAnimation(animation1, forKey: "")
        self.layer!.addAnimation(animation2, forKey: "")
        
        let animation = CABasicAnimation(keyPath: "lineWidth")
        animation.fromValue = 1
        animation.toValue = 10
        animation.duration = 2
        animation.delegate = self
                animation.fillMode = kCAFillModeForwards;
                animation.removedOnCompletion = false

        self.layer!.addAnimation(animation, forKey: "")
        
        let anGroup = CAAnimationGroup()
        anGroup.animations = [animation1,animation2,animation]
        
        self.layer?.addAnimation(anGroup, forKey: "groupAnimation")
        
        //anGroup.delegate = self
//        anGroup.fillMode = kCAFillModeRemoved;
//        anGroup.removedOnCompletion = true
    }
    
    override func animationDidStart(anim: CAAnimation) {
        print("动画开始")
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        print("动画结束")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

