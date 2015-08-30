//
//  AdBanner.swift
//  ShopOnline
//
//  Created by Canh on 8/31/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit
import CoreData

@objc(AdBanner)

class AdBanner: NSManagedObject
{
    @NSManaged var nameAd: String
    @NSManaged var imageBanner: NSData
    @NSManaged var pageLevel: NSNumber
}
