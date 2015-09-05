//
//  Product.swift
//  ShopOnline
//
//  Created by Canh on 9/5/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit
import Parse

class Product: PFObject, PFSubclassing
{
    @NSManaged var userID : PFUser
    @NSManaged var commentID : PFRelation -> Comment
    @NSManaged var discountProduct : Int
    @NSManaged var imageID : PFRelation -> ImageProduct
    @NSManaged var imageProduct : PFFile
    @NSManaged var likeNumber : Int
    @NSManaged var nameCategories : MenuCategoriesParse
    @NSManaged var numberProduct : Int
    @NSManaged var priceProduct : String?
    @NSManaged var status : String?
    @NSManaged var subTitle : String?
    @NSManaged var title : String?
    @NSManaged var transportFee : Int
    
    class func parseClassName() -> String {
        return "Products"
    }
    
    //2
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    override class func query() -> PFQuery? {
        let query = PFQuery(className: Product.parseClassName())
        return query
    }
    
    init(imageCategories: PFFile, nameCategories: String?, version: String?, tag: NSInteger) {
        super.init()
    }
    
    override init() {
        super.init()
    }

}
