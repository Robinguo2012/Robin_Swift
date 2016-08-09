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

class SlideMenuViewController: UIViewController,UIGestureRecognizerDelegate {

    public enum SlideAction{
        case Open
        case Close
    }
    
    public enum TrackAction{
        case LeftTapOpen
        case LeftTapClose
        case LeftFlickOpen
        case LeftFlickClose
        case RightTapOpen
        case RightTapClose
        case RightFlickOpen
        case RightFlickClose
    }
    
    struct PanInfo {
        var action: SlideAction
        var shouldBounce: Bool
        var velocity: CGFloat
    }
    
    public weak var delegate: SlideMenuViewControllerDelegate?
    
    public var opacityView = UIView()
    public var mainContainerView = UIView()
    public var leftContainerVeiw = UIView()
    public var rightContainerView = UIView()
    public var mainViewController: UIViewController?
    public var leftViewController: UIViewController?
    public var rightViewController: UIViewController?
    public var leftPanGesture: UIPanGestureRecognizer?
    public var leftTapGesture: UITapGestureRecognizer?
    public var rightTapGesture: UITapGestureRecognizer?
    public var rightPanGesture: UIPanGestureRecognizer?
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    public convenience init(mainViewController: UIViewController, leftViewController: UIViewController){
        self.init()
        self.mainViewController = mainViewController
        self.leftViewController = leftViewController
    }
    
    public convenience init(mainViewController: UIViewController, rightViewController: UIViewController){
        self.init()
        self.mainViewController = mainViewController
        self.rightViewController = rightViewController
    }
    
    public convenience init(mainViewController: UIViewController, rightViewController: UIViewController, leftViewController: UIViewController){
        self.init()
        self.mainViewController = mainViewController
        self.leftViewController = leftViewController
        self.rightViewController = rightViewController
    }
    
    
    
    public func initView(){
        
        mainContainerView = UIView(frame: view.bounds)
        mainContainerView.autoresizingMask = [.FlexibleWidth,.FlexibleHeight]
        mainContainerView.backgroundColor = UIColor.clearColor()
        view.insertSubview(mainContainerView, atIndex: 0)
        
        var opacityFrame: CGRect = view.bounds
        let opacityOffset: CGFloat = 0.0
        opacityFrame.origin.x = opacityFrame.origin.x + opacityOffset
//        opacityFrame.origin.y = opacityFrame.origin.y + opacityOffset
        opacityFrame.size.height = opacityFrame.size.height - opacityOffset
        opacityView = UIView(frame: opacityFrame)
        opacityView.backgroundColor = SlideOptions.opacityViewBackgroundColor
        opacityView.autoresizingMask = [.FlexibleHeight,.FlexibleWidth]
        opacityView.layer.opacity = 0.0
        view.insertSubview(opacityView, atIndex: 1)
        
        if leftViewController != nil {
            var leftFrame: CGRect = view.bounds
            leftFrame.size.width = SlideOptions.leftViewWidth
            leftFrame.origin.x = leftMargin()
            let leftOffset: CGFloat = 0.0
            leftFrame.origin.y = leftFrame.origin.y + leftOffset
            leftFrame.size.height = leftFrame.size.height - leftOffset
            leftContainerVeiw = UIView(frame: leftFrame)
            leftContainerVeiw.backgroundColor = UIColor.clearColor()
            leftContainerVeiw.autoresizingMask = [.FlexibleHeight]
            view.insertSubview(leftContainerVeiw, atIndex: 2)
            addLeftGesture()
        }
        
        if rightViewController != nil {
            var rightFrame: CGRect = view.bounds
            rightFrame.size.width = SlideOptions.rightViewWidth
            rightFrame.origin.x = rightMargin()
            let rightOffset: CGFloat = 0.0
            rightFrame.origin.y = rightFrame.origin.y - rightOffset
            rightFrame.size.height = rightFrame.size.height + rightOffset
            rightContainerView = UIView(frame: rightFrame)
            rightContainerView.backgroundColor = UIColor.clearColor()
            rightContainerView.autoresizingMask = [.FlexibleHeight]
            view.insertSubview(rightContainerView, atIndex: 3)
            
            
        }
    }
    
    public func addLeftGesture(){
        
        if leftViewController != nil {
            if leftPanGesture == nil {
                leftPanGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handleLeftPanGesture(_:)))
                leftPanGesture?.delegate = self
                view.addGestureRecognizer(leftPanGesture!)
            }
            
            if leftTapGesture == nil {
                leftTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleLeftTapGesture(_:)))
                leftTapGesture?.delegate = self
                view.addGestureRecognizer(leftTapGesture!)
            }
        }
    }
    
    public func removeLeftGesture() {
        
        if leftPanGesture != nil {
            view.removeGestureRecognizer(leftPanGesture!)
        }
        
        if leftTapGesture != nil {
            view.removeGestureRecognizer(leftTapGesture!)
        }
    }
    
    struct LeftPanState {
        static var frameAtStartPan: CGRect = CGRectZero
        static var startPointOfPan: CGPoint = CGPointZero
        static var wasOpenAtStartOfPan: Bool = false
        static var wasHiddenAtStartOfPan: Bool = false
        static var lastState: UIGestureRecognizerState = .Ended
    }
    
    //MARK: 向左的滑动和点击手势
    func handleLeftPanGesture(panGesture: UIPanGestureRecognizer) {
        if !isTargetViewController() {
            return
        }
        
        if isRightOpen() {
            return
        }
        
        switch panGesture.state {
        case .Began:
            if LeftPanState.lastState != .Ended && LeftPanState.lastState != .Cancelled && LeftPanState.lastState != .Failed {
                return
            }
            
            if isLeftHidden() {
                self.delegate?.leftWillOpen?()
            }else{
                self.delegate?.leftWillClose?()
            }
            
            LeftPanState.frameAtStartPan = leftContainerVeiw.frame
            LeftPanState.startPointOfPan = panGesture.locationInView(view)
            LeftPanState.wasOpenAtStartOfPan = isLeftOpen()
            LeftPanState.wasHiddenAtStartOfPan = isLeftHidden()
            
            leftViewController?.beginAppearanceTransition(LeftPanState.wasOpenAtStartOfPan, animated: true)
            
        default:
            <#code#>
        }
        
    }
    
    func handleLeftTapGesture(tapGesture: UITapGestureRecognizer) {
        
    }
    
    public func addRightGesture(){
        
        if rightViewController != nil {
            
            if rightPanGesture == nil {
                rightPanGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handleRightPanGesture(_:)))
                rightPanGesture?.delegate = self
                self.view.addGestureRecognizer(rightPanGesture!)
            }
            
            if rightTapGesture == nil {
                rightTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleRightTapGesture(_:)))
                rightTapGesture?.delegate = self
                view.addGestureRecognizer(rightTapGesture!)
            }
        }
    }
    
    func removeRightGesture() {
        if rightPanGesture != nil {
            view.removeGestureRecognizer(rightPanGesture!)
        }
        
        if rightTapGesture != nil {
            view.removeGestureRecognizer(rightTapGesture!)
        }
    }
    
    
    //MARK: 向右的滑动和点击手势
    func handleRightPanGesture(panGes: UIPanGestureRecognizer) {
        
    }
    
    func handleRightTapGesture(tapGes: UITapGestureRecognizer) {
        
    }
    
    public override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        mainContainerView.transform = CGAffineTransformMakeScale(1.0, 1.0)
        leftContainerVeiw.hidden = true
        rightContainerView.hidden = true
        
        coordinator.animateAlongsideTransition(nil, completion: { (context: UIViewControllerTransitionCoordinatorContext!) -> Void in
            
            self.closeLeftNonAnimation()
            self.closeRightNonAnimation()
            self.leftContainerVeiw.hidden = false
            self.rightContainerView.hidden = false
            
            if self.rightTapGesture != nil && self.rightPanGesture != nil{
                self.removeRightGesture()
                self.addRightGesture()
            }
            
            if self.leftTapGesture != nil && self.leftPanGesture != nil {
                self.removeLeftGesture()
                self.addLeftGesture()
            }
            
        })
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = UIRectEdge.None
    }
    
    public override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if let mainViewController = self.mainViewController {
            return mainViewController.supportedInterfaceOrientations()
        }
        
        return UIInterfaceOrientationMask.All
    }
    
    public override func shouldAutorotate() -> Bool {
        return mainViewController?.shouldAutorotate() ?? false
    }
    
    public override func viewWillLayoutSubviews() {
        setUpViewController(mainContainerView, targetViewController: mainViewController)
        setUpViewController(leftContainerVeiw, targetViewController: leftViewController)
        setUpViewController(rightContainerView, targetViewController: rightViewController)
    }
    
    private func leftMargin() -> CGFloat{
        return -SlideOptions.leftViewWidth
    }
    
    private func rightMargin() -> CGFloat {
        return -CGRectGetWidth(view.bounds)
    }
    
    // MARK: 测试
    public func closeLeftNonAnimation() {
        setCloseWindowLevel()
        let finalXOrigin = leftMargin()
        var frame: CGRect = leftContainerVeiw.frame
        frame.origin.x = finalXOrigin
        leftContainerVeiw.frame = frame
        opacityView.layer.opacity = 0.0
        mainContainerView.transform = CGAffineTransformMakeScale(1.0, 1.0)
        removeShadow(leftContainerVeiw)
        enableContentInteraction()
    }
    
    public func closeRightNonAnimation() {
        setCloseWindowLevel()
        let finalXOrigin = rightMargin()
        var frame: CGRect = rightContainerView.frame
        frame.origin.x = finalXOrigin
        rightContainerView.frame = frame
        opacityView.layer.opacity = 0.0
        mainContainerView.transform = CGAffineTransformMakeScale(1.0, 1.0)
        removeShadow(rightContainerView)
        enableContentInteraction()
    }
    
    private func setCloseWindowLevel() {
        if SlideOptions.hiddenStatusBar {
            dispatch_async(dispatch_get_main_queue(), {
                if let window = UIApplication.sharedApplication().keyWindow{
                    window.windowLevel = UIWindowLevelNormal
                }
            })
        }
    }
    
    private func removeShadow(targetView: UIView) {
        targetView.layer.masksToBounds = true
        targetView.layer.opacity = 1.0
    }
    
    private func enableContentInteraction() {
        mainContainerView.userInteractionEnabled = true
    }
    
    private func setUpViewController(targetView: UIView,targetViewController: UIViewController?){
        if let viewController = targetViewController {
            self.addChildViewController(viewController)
            viewController.view.frame = targetView.bounds
            targetView.addSubview(viewController.view)
            viewController.didMoveToParentViewController(self)
        }
    }
    
    public func isTargetViewController() -> Bool{
        //
        return true
    }
    
    public func Track(track: TrackAction) {
        // function for tracking
        // please override it if neccessary
    }
    
    public func isRightOpen() -> Bool{
        return  rightViewController != nil && rightContainerView.frame.origin.x == CGRectGetWidth(view.bounds) - rightContainerView.frame.size.width
    }
    
    public func isRightHidden() -> Bool{
        return rightContainerView.frame.origin.x >= CGRectGetWidth(view.bounds)
    }
    
    public func isLeftOpen() -> Bool{
        return leftViewController != nil && leftContainerVeiw.frame.origin.x == 0.0
    }
    
    public func isLeftHidden() -> Bool{
        return leftContainerVeiw.frame.origin.x >= leftMargin()
    }
    
}
