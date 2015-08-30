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
    
    func appDelegateManagedObject() -> NSManagedObjectContext
    {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let objectContext = appDelegate.managedObjectContext
        return objectContext!
    }
}
