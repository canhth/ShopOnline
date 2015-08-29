//
//  UIViewController+Custom.swift
//  ShopOnline
//
//  Created by CanhTran on 8/11/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setNavigationBarItem()
    {
        self.addLeftBarButtonWithImage(UIImage(named: "ic_menu_black_24dp")!)
        self.addRightBarButtonWithImage(UIImage(named: "ic_notifications_black_24dp")!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addLeftGestures()
        self.slideMenuController()?.addRightGestures()
    }
    
    func removeNavigationBarItem()
    {
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
    }
    
    func getWidthScreen() -> CGFloat
    {
       return UIScreen.mainScreen().bounds.size.width
    }
    
    func getHeightScreen() -> CGFloat
    {
        return UIScreen.mainScreen().bounds.size.height
    }
    
    func setupPushView(view : AnyClass ) -> UIViewController
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier(String.className(view)) as! UIViewController
        return vc
    }
    
    // MARK: - Gesture & keyboard
    
    func addGesture()
    {
        //Looks for single or multiple taps.
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard()
    {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    // MARK: - Add done button keyboard
    func addDoneButtonOnKeyboard(textField:UITextField)
    {
        var doneToolbar: UIToolbar = UIToolbar(frame: CGRectMake(0, 0, 320, 50))
        doneToolbar.barStyle = UIBarStyle.BlackTranslucent
        
        var flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        var done: UIBarButtonItem = UIBarButtonItem(title: "Hoàn thành", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("doneButtonAction"))
        
        var items = NSMutableArray()
        items.addObject(flexSpace)
        items.addObject(done)
        
        doneToolbar.items = items as [AnyObject]
        doneToolbar.sizeToFit()
        
        textField.inputAccessoryView = doneToolbar
        textField.inputAccessoryView = doneToolbar
        
    }
}