//
//  CustomUIButton.swift
//  ShopOnline
//
//  Created by Canh on 9/6/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

class CustomUIButton: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
    }
}
