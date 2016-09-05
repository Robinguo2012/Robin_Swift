//
//  WXPullView.swift
//  BezierPathCAShapeLayer
//
//  Created by sks on 16/9/5.
//  Copyright © 2016年 sks. All rights reserved.
//

import UIKit

class WXPullView: UIView {

    // MARK: Properties
    lazy var eyeFirstLightLayer: CAShapeLayer = {
        
        let eyeFirstlayer = CAShapeLayer()
        let point = CGPointMake(self.frame.width/2, self.frame.height/2)
        //        let path = UIBezierPath(arcCenter: point, radius: CGRectGetWidth(self.frame) * 0.2, startAngle: (230 / 180) * M_PI, endAngle:(230 / 180) * M_PI, clockwise: true)
        let path = UIBezierPath(arcCenter: point, radius: CGRectGetWidth(self.frame) * 0.2, startAngle: CGFloat((230 / 180) * M_PI), endAngle: CGFloat((265 / 180) * M_PI), clockwise: true)
        eyeFirstlayer.borderColor = UIColor.blackColor().CGColor
        eyeFirstlayer.lineWidth = 5.0
        eyeFirstlayer.fillColor = UIColor.clearColor().CGColor
        eyeFirstlayer.strokeColor = UIColor.whiteColor().CGColor
        eyeFirstlayer.path = path.CGPath
        return eyeFirstlayer
    }()
    
    lazy var eyeSecondLightLayer: CAShapeLayer = {
        
        let eyeSecondlayer = CAShapeLayer()
        let point = CGPointMake(self.frame.width/2, self.frame.height/2)
        let path = UIBezierPath(arcCenter: point, radius: CGRectGetWidth(self.frame) * 0.2, startAngle: CGFloat((211 / 180) * M_PI), endAngle: CGFloat((220 / 180) * M_PI), clockwise: true)
        eyeSecondlayer.borderColor = UIColor.blackColor().CGColor
        eyeSecondlayer.lineWidth = 5.0
        eyeSecondlayer.fillColor = UIColor.clearColor().CGColor
        eyeSecondlayer.strokeColor = UIColor.whiteColor().CGColor
        eyeSecondlayer.path = path.CGPath
        
        return eyeSecondlayer
    }()
    
    lazy var eyeBallLightLayer:CAShapeLayer = {
        
        let eyeBalllayer = CAShapeLayer()
        let point = CGPointMake(self.frame.width/2, self.frame.height/2)
        
        let path = UIBezierPath(arcCenter: point, radius: CGRectGetWidth(self.frame) * 0.3, startAngle: CGFloat(M_PI * 0 / 180)  , endAngle: CGFloat(M_PI * 360 / 180), clockwise: true)
        
        eyeBalllayer.lineWidth = 1.0
        eyeBalllayer.borderColor = UIColor.blackColor().CGColor
        eyeBalllayer.fillColor = UIColor.clearColor().CGColor
        eyeBalllayer.strokeColor = UIColor.whiteColor().CGColor
        eyeBalllayer.path = path.CGPath
        eyeBalllayer.anchorPoint = CGPointMake(0.5, 0.5)
        
        return eyeBalllayer
        
    }()
    
    
    lazy var topSocketLayer:CAShapeLayer = {
        let topLayer = CAShapeLayer()
        let center = CGPointMake(self.frame.width/2, self.frame.height/2)
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(0, CGRectGetHeight(self.frame)/2))
        path.addQuadCurveToPoint(CGPointMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)/2), controlPoint: CGPointMake(CGRectGetWidth(self.frame)/2, center.y - center.y - 20))
        
        topLayer.path = path.CGPath
        topLayer.fillColor = UIColor.clearColor().CGColor
        topLayer.strokeColor = UIColor.whiteColor().CGColor
        topLayer.lineWidth = 1.0
        topLayer.borderColor = UIColor.blackColor().CGColor
        
        return topLayer
    }()
    
    lazy var bottomSocketLayer:CAShapeLayer = {
        
        let bottomLayer = CAShapeLayer()
        let center = CGPointMake(self.frame.width/2, self.frame.height/2)
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(0, CGRectGetHeight(self.frame)/2))
        path.addQuadCurveToPoint(CGPointMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)/2), controlPoint: CGPointMake(CGRectGetWidth(self.frame)/2, center.y + center.y + 20))
        
        bottomLayer.borderColor = UIColor.blackColor().CGColor
        
        bottomLayer.path = path.CGPath
        bottomLayer.fillColor = UIColor.clearColor().CGColor
        bottomLayer.strokeColor = UIColor.whiteColor().CGColor
        bottomLayer.lineWidth = 1.0
        
        return bottomLayer
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.addSublayer(self.eyeFirstLightLayer)
        self.layer.addSublayer(self.eyeSecondLightLayer)
        self.layer.addSublayer(self.eyeBallLightLayer)
        self.layer.addSublayer(self.topSocketLayer)
        self.layer.addSublayer(self.bottomSocketLayer)
        self.setupAnimation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupAnimation() {
        
        self.eyeFirstLightLayer.lineWidth = 0.0
        self.eyeSecondLightLayer.lineWidth = 0.0
        self.eyeBallLightLayer.opacity = 0.0
        
        self.topSocketLayer.strokeStart = 0.5
        self.topSocketLayer.strokeEnd = 0.5
        self.bottomSocketLayer.strokeStart = 0.5
        self.bottomSocketLayer.strokeEnd = 0.5
    }
    
    func animationWithY(originY: CGFloat) {
        
        let flag = self.frame.origin.y * 2.0 - 20.0
        
        if originY < flag {
            if self.eyeFirstLightLayer.lineWidth < 5.0 {
                self.eyeFirstLightLayer.lineWidth += 1.0
                self.eyeSecondLightLayer.lineWidth += 1.0
            }
        }
        
        if originY < flag - 20 {
            if self.eyeBallLightLayer.opacity <= 1.0 {
                self.eyeBallLightLayer.opacity += 1.0
            }
        }
        
        if originY < flag - 40 {
            if self.topSocketLayer.strokeStart > 0.0 && self.topSocketLayer.strokeEnd < 1.0 {
                self.topSocketLayer.strokeStart -= 0.1
                self.topSocketLayer.strokeEnd += 0.1
                self.bottomSocketLayer.strokeStart -= 0.1
                self.bottomSocketLayer.strokeEnd += 0.1
            }
        }
        
        if originY > flag - 40 {
            
            if self.topSocketLayer.strokeStart < 0.5 && self.topSocketLayer.strokeEnd > 0.5 {
                self.topSocketLayer.strokeStart += 0.1
                self.topSocketLayer.strokeEnd -= 0.1
                self.bottomSocketLayer.strokeStart += 0.1
                self.bottomSocketLayer.strokeEnd -= 0.1
            }
        }
        
        if originY > flag - 20 {
            if self.eyeBallLightLayer.opacity >= 0.0 {
                self.eyeBallLightLayer.opacity -= 0.1
            }
        }
        
        if originY > flag {
            if self.eyeFirstLightLayer.lineWidth > 0.0 {
                self.eyeFirstLightLayer.lineWidth -= 1.0
                self.eyeSecondLightLayer.lineWidth -= 1.0
            }
        }
        
    }
}
