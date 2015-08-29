//
//  UIAlertView+Custom.swift
//  ShopOnline
//
//  Created by Canh on 8/29/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

public extension UIAlertView {
    
    class func showAlertView(title:String , message:String)
    {
        let alert = UIAlertView()
        alert.title = title
        alert.message = message
        alert.addButtonWithTitle("OK")
        alert.show()
    }
}