//
//  NSManagedObjectContext.swift
//  ShopOnline
//
//  Created by Canh on 8/31/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    
    convenience init(parentContext parent: NSManagedObjectContext, concurrencyType: NSManagedObjectContextConcurrencyType)
    {
        self.init(concurrencyType: concurrencyType)
        parentContext = parent
    }
    
    func deleteAllObjects(error: NSErrorPointer) {
        
        if let entitesByName = persistentStoreCoordinator?.managedObjectModel.entitiesByName as? [String: NSEntityDescription]
        {
            
            for (name, entityDescription) in entitesByName
            {
                deleteAllObjectsForEntity(entityDescription, error: error)
                
                // If there's a problem, bail on the whole operation.
                if error.memory != nil
                {
                    return
                }
            }
        }
    }
    
    func deleteAllObjectsForEntity(entity: NSEntityDescription, error: NSErrorPointer)
    {
        let fetchRequest = NSFetchRequest()
        fetchRequest.entity = entity
        fetchRequest.fetchBatchSize = 50
        
        let fetchResults = executeFetchRequest(fetchRequest, error: error)
        
        if error.memory != nil
        {
            return
        }
        
        if let managedObjects = fetchResults as? [NSManagedObject]
        {
            for object in managedObjects
            {
                deleteObject(object)
            }
        }
    }
    /**
    Import data get from Parse into Coredata
    
    :param: nameCategories
    :param: imageCategories
    :param: version
    :param: tag
    */
    func addData(nameCategories: AnyObject, imageCategories:UIImage?, version:AnyObject, tag:NSInteger, managedObjectContext:NSManagedObjectContext)
    {
        // Create object with entity name
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("MenuCategories", inManagedObjectContext: managedObjectContext) as! MenuCategories
        newItem.nameCategories = nameCategories as! String
        newItem.tag = tag
        newItem.imageCategories = UIImageJPEGRepresentation( imageCategories, 1);
        newItem.version = version as! String
        
        var error : NSError? = nil
        // Save object
        if !managedObjectContext.save(&error)
        {
            NSLog("Unresolved error \(error), \(error!.userInfo)")
            abort()
        }
    }

}