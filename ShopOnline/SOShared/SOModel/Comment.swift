//
//  Comment.swift
//  ShopOnline
//
//  Created by Canh on 9/5/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit
import Parse

class Comment: PFObject, PFSubclassing {
    
    @NSManaged var contentComment : String
    @NSManaged var userID : User
    @NSManaged var productID : String
    
    class func parseClassName() -> String {
        return "CommentProduct"
    }
    
    //2
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    override class func query() -> PFQuery? {
        let query = PFQuery(className: Comment.parseClassName()) //1

        return query
    }
    
    init(imageCategories: PFFile, nameCategories: String?, version: String?, tag: NSInteger) {
        super.init()

    }
    
    class func getUserByCommentID(userID : User) -> User
    {
        let querry = Comment.query()
        var userComment:User = User()
        querry!.includeKey("userID")
        querry?.whereKey("userID", equalTo: userID)
        
        querry!.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil
            {
                println(objects)
                if let user:[User] = objects as? [User]
                {
                    userComment = user[0]
                }
            }
        }
    
        return userComment
    }
    
    override init() {
        super.init()
    }

}
