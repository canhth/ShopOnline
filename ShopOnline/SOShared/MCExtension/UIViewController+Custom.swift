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
}