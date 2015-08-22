//
//  UIView+Custom.swift
//  ShopOnline
//
//  Created by Canh on 8/22/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

public extension UIView {
    
    func setupBorderView()
    {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 40
        self.clipsToBounds = true
    }
    
    func setupBlurEffectView()
    {
        //only apply the blur if the user hasn't disabled transparency effects
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            self.backgroundColor = UIColor.clearColor()
            
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            //always fill the view
            blurEffectView.frame = self.bounds
            //blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
            
            self.addSubview(blurEffectView) //if you have more UIViews, use an insertSubview API to place it where needed
        } 
        else {
            self.backgroundColor = UIColor.blackColor()
        }
    }
}
