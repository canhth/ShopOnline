//
//  NSString+Custom.swift
//  ShopOnline
//
//  Created by CanhTran on 8/11/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import Foundation

extension String {
    static func className(aClass: AnyClass) -> String
    {
        return NSStringFromClass(aClass).componentsSeparatedByString(".").last!
    }
}