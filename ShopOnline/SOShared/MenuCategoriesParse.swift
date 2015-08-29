//
//  MenuCategoriesParse.swift
//  ShopOnline
//
//  Created by Canh on 8/29/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit
import Foundation
import Parse

class MenuCategoriesParse: PFObject, PFSubclassing {
    @NSManaged var imageCategories: PFFile
    @NSManaged var nameCategories: String?
    @NSManaged var version: String?
    @NSManaged var tag: NSInteger
    //1
    class func parseClassName() -> String {
        return "CategoriesMenu"
    }
    
    //2
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    override class func query() -> PFQuery? {
        let query = PFQuery(className: MenuCategoriesParse.parseClassName()) //1
        query.orderByDescending("tag") //3
        return query
    }
    
    init(imageCategories: PFFile, nameCategories: String?, version: String?, tag: NSInteger) {
        super.init()
        self.imageCategories = imageCategories
        self.nameCategories = nameCategories
        self.version = version
        self.tag = tag
    }
    
    override init() {
        super.init()
    }
    
}