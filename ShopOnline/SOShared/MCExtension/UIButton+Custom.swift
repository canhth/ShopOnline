//
//  UIButton+Custom.swift
//  ShopOnline
//
//  Created by Canh on 8/29/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import Foundation
import UIKit

public extension UIButton {
    
    func setupBorder(width:CGFloat , color:UIColor, radius:CGFloat)
    {
        self.layer.borderWidth = width
        self.layer.borderColor = color.CGColor
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}