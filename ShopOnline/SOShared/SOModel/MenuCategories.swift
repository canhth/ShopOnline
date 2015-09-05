//
//  MenuCategories.swift
//  
//
//  Created by Canh on 8/29/15.
//
//

import Foundation
import CoreData

@objc(MenuCategories)

class MenuCategories: NSManagedObject {

    @NSManaged var objectId: String
    @NSManaged var nameCategories: String
    @NSManaged var version: String
    @NSManaged var imageCategories: NSData
    @NSManaged var tag: NSNumber
}
