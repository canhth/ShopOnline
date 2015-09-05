//
//  ImageProduct.swift
//  ShopOnline
//
//  Created by Canh on 9/5/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit
import Parse

class ImageProduct: PFObject, PFSubclassing
{
    @NSManaged var imageProduct : PFFile
    
    class func parseClassName() -> String {
        return "ImageProduct"
    }
    
    override class func query() -> PFQuery? {
        let query = PFQuery(className: ImageProduct.parseClassName()) //1
        return query
    }
    
}
