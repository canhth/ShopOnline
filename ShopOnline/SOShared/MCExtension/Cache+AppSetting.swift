//
//  Cache+AppSetting.swift
//  ShopOnline
//
//  Created by Canh on 8/24/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

class Cache_AppSetting: NSObject {
 
    func setBoolValue(value: Bool, key:String)
    {
        let userDefault = NSUserDefaults.standardUserDefaults()
        userDefault.setBool(value, forKey: key)
        userDefault.synchronize()
    }
    func boolValueForKey(key:String) -> Bool
    {
        let userDefault = NSUserDefaults.standardUserDefaults()
        return userDefault.boolForKey(key)
    }
    
    func setIntergerValue(value:NSInteger, key:String)
    {
        let userDefaut = NSUserDefaults.standardUserDefaults()
        userDefaut.setInteger(value, forKey: key)
    }
    func intergerValueForKey(key:String) -> NSInteger
    {
        let userDefaut = NSUserDefaults.standardUserDefaults()
        return userDefaut.integerForKey(key)
    }
}
