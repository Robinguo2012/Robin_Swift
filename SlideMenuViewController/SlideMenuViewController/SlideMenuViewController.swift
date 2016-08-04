//
//  SlideMenuViewController.swift
//  SlideMenuViewController
//
//  Created by sks on 16/8/4.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol SlideMenuViewControllerDelegate{
    
    optional func leftWillOpen()
    optional func leftDidOpen()
    optional func leftWillClose()
    optional func leftDidClose()
    optional func rightWillOpen()
    optional func rightDidOpen()
    optional func rightDidClose()
}

public struct SlideOptions {
    
    public static var leftViewWidth: CGFloat = 270.0
    public static var leftBezelWidth: CGFloat = 16.0
    public static var contentViewScale: CGFloat = 0.96
    public static var contentViewOpacity: CGFloat = 0.5
    public static var contentViewDrag: Bool = false
    public static var shadowOpacity: CGFloat = 0.0
    public static var shadowRadius: CGFloat = 0.0
    public static var shadowOffset: CGSize = CGSizeMake(0, 0)
    public static var panFromBezel: Bool = true
    public static var animationDuration: CGFloat = 0.4
    
    public static var rightViewWidth: CGFloat = 270.0
    public static var rightBezelWidth: CGFloat = 16.0
    public static var rightPanFromBezel: Bool = false
    
    public static var hiddenStatusBar: Bool = true
    public static var pointOfNoReturnWidth: CGFloat = 40.0
    public static var simultaneousGestureRecognizers: Bool = true
    public static var opacityViewBackgroundColor: UIColor = UIColor.blackColor()
}

class SlideMenuViewController: UIViewController {

}
