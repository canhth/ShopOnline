//
//  UITextView+Custom.swift
//  ShopOnline
//
//  Created by Canh on 9/16/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

extension UITextView
{
    func heightForView(text:String, width:CGFloat) -> CGFloat {
        let font = UIFont(name: "Helvetica Neue", size: 20.0)
        let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.max))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.font = font
        label.text = text
        
        label.sizeToFit()
        return label.frame.height
    }

}