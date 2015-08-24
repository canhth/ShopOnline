//
//  Cache.swift
//  ShopOnline
//
//  Created by Canh on 8/24/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

public class Cache: AnyObject
{
    class func setBoolValue(value: Bool, key:String)
    {
        let userDefault = NSUserDefaults.standardUserDefaults()
        userDefault.setBool(value, forKey: key)
        userDefault.synchronize()
    }
    class func boolValueForKey(key:String) -> Bool
    {
        let userDefault = NSUserDefaults.standardUserDefaults()
        return userDefault.boolForKey(key)
    }
    
    class func setIntergerValue(value:NSInteger, key:String)
    {
        let userDefault = NSUserDefaults.standardUserDefaults()
        userDefault.setInteger(value, forKey: key)
        userDefault.synchronize()
    }
    class func intergerValueForKey(key:String) -> NSInteger
    {
        let userDefaut = NSUserDefaults.standardUserDefaults()
        return userDefaut.integerForKey(key)
    }
    
    class func setObjectValue(object:AnyObject, key:String)
    {
        let encodedObject = NSKeyedArchiver.archivedDataWithRootObject(object)
        let userDefault = NSUserDefaults.standardUserDefaults()
        userDefault.setObject(encodedObject, forKey: key)
        userDefault.synchronize()
    }
    
    class func getObjectForKey(key:String) -> AnyObject
    {
        let userDefault = NSUserDefaults.standardUserDefaults()
        return userDefault.objectForKey(key)!
    }
    
}
