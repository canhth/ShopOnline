//
//  User.swift
//  ShopOnline
//
//  Created by Canh on 9/5/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit
import Parse

class User: PFObject, PFSubclassing {
    @NSManaged var username : String?
    @NSManaged var password : String?
    @NSManaged var avartaProfile: PFFile
    @NSManaged var email: String?
    @NSManaged var phoneNumber: String?
    
    class func parseClassName() -> String {
        return "User"
    }
    
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    override class func query() -> PFQuery? {
        let query = PFQuery(className: User.parseClassName()) //1
        return query
    }

    override init() {
        super.init()
    }

}
