//
//  MenuCategories.swift
//  ShopOnline
//
//  Created by Canh on 8/29/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import Foundation
import CoreData

@objc(MenuCategories)
class MenuCategories: NSManagedObject
{
    @NSManaged var nameCategories: String
    @NSManaged var version: String
    @NSManaged var imageCategories: NSData
    @NSManaged var tag: NSNumber
}