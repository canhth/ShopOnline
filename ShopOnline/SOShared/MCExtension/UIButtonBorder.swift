//
//  UIButtonBorder.swift
//  ShopOnline
//
//  Created by Canh on 9/11/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

class UIButtonBorder: UIButton {
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.whiteColor().CGColor
    }
}
