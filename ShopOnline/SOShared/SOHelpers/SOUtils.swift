//
//  SOUtils.swift
//  ShopOnline
//
//  Created by Canh on 8/22/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit
import CoreData
class SOUtils: NSObject {
    
    class var sharedInstance: SOUtils
    {
        struct Static
        {
            static var onceToken: dispatch_once_t = 0
            static var instance: SOUtils? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = SOUtils()
        }
        return Static.instance!
    }
    
    func isIphone4() -> Bool
    {
        if UIDevice().userInterfaceIdiom == .Phone {
            if UIScreen.mainScreen().nativeBounds.height == 960
            {
                return true
            }
        }
        return false
    }
    
    func isIphone5() -> Bool
    {
        if UIDevice().userInterfaceIdiom == .Phone {
            if UIScreen.mainScreen().nativeBounds.height == 1136
            {
                return true
            }
        }
        return false
    }
    
    func isIphone6() -> Bool
    {
        if UIDevice().userInterfaceIdiom == .Phone {
            if UIScreen.mainScreen().nativeBounds.height == 1334
            {
                return true
            }
        }
          return false
    }
    
    func isIphone6Plush() -> Bool
    {
        if UIDevice().userInterfaceIdiom == .Phone {
            if UIScreen.mainScreen().nativeBounds.height == 2208
            {
                return true
            }
        }
        return false
    }
    
    func getRatioHeight() -> CGFloat
    {
        if isIphone4()
        {
            return 1
        }
        else
        {
            return UIScreen.mainScreen().bounds.size.height / 568
        }
    }
    func getRatioWidth() -> CGFloat
    {
        if isIphone4()
        {
            return 1
        }
        else
        {
            return UIScreen.mainScreen().bounds.size.height / 320
        }
    }

    func appDelegateManagedObject() -> NSManagedObjectContext
    {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let objectContext = appDelegate.managedObjectContext
        return objectContext!
    }

    func getLocationAppDelegate() -> AnyObject
    {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let objectLocation = appDelegate.locationManager
        return objectLocation
    }
}
