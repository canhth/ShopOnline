//
//  Appdelegate+Custom.swift
//  ShopOnline
//
//  Created by Canh on 8/29/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit
import Parse
import CoreData

extension AppDelegate
{
    /**
    Update database from server into Core Data
    */
    func loadData()
    {
       var netWorking = SONetworking()
        
        //Having connect internet
        if netWorking.isHaveConnection()
        {
            let querry = PFQuery(className: "CategoriesMenu")
            querry.orderByDescending("tag")
            querry.findObjectsInBackgroundWithBlock({(objects , error) -> Void in
                if let menuCategories = objects as? [PFObject]
                {
                    let version: AnyObject? = menuCategories[0].objectForKey("versionApp")
                    var error : NSError?
                    // Check version of data. If diffirent -> let update, or do not thing
                    if self.deleteData("CategoriesMenu", version: version!)
                    {
                        for category:AnyObject in menuCategories
                        {
                            // Get data form server with PFObject
                            let nameCategory: AnyObject? = category.objectForKey("nameCategories")
                            let version: AnyObject = category.objectForKey("versionApp")!
                            let tag = category.objectForKey("tag") as! NSInteger
                            let image = category.objectForKey("imageCategories") as! PFFile
                            /**
                            *  Get image in background
                            */
                            image.getDataInBackgroundWithBlock({
                                (imageData, error ) -> Void in
                                if (error == nil)
                                {
                                    // Get image with PFFile
                                    let image = UIImage(data:imageData!)
                                    // Import data into core data
                                    self.addData(nameCategory!, imageCategories: image, version: version, tag: tag)
                                }
                            })
                        }
                    }
                    else
                    {
                        println("Not thing change in server!!!")
                    }
                }
            })
        }
        else
        {
            println("No internet accsess")
        }
    }
    
    /**
    Import data get from Parse into Coredata
    
    :param: nameCategories
    :param: imageCategories
    :param: version
    :param: tag
    */
    func addData(nameCategories: AnyObject, imageCategories:UIImage?, version:AnyObject, tag:NSInteger)
    {
        // Create object with entity name
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("MenuCategories", inManagedObjectContext: self.managedObjectContext!) as! MenuCategories
        newItem.nameCategories = nameCategories as! String
        newItem.tag = tag
        newItem.imageCategories = UIImageJPEGRepresentation( imageCategories, 1);
        newItem.version = version as! String
        
        var error : NSError? = nil
        // Save object
        if !self.managedObjectContext!.save(&error)
        {
            NSLog("Unresolved error \(error), \(error!.userInfo)")
            abort()
        }
    }
    
    /**
    Delete all object of entity with name to insert new object
    
    :param: entityName
    */
    func deleteData(entityName:String, version:AnyObject) -> Bool
    {
        // Create fetch request
        let fetchRequest = NSFetchRequest(entityName: entityName)
        var error: NSError?
        // Get list object of Entity
        let items = self.managedObjectContext!.executeFetchRequest(fetchRequest, error: &error) as! [MenuCategories]
        println(error?.description)
        // Check the version is changed ?
        if (items[0].version != version as! String)
        {
            // Delete all object of core data
            for item in items
            {
                self.managedObjectContext!.deleteObject(item as NSManagedObject)
            }
            // Save object
            if !self.managedObjectContext!.save(&error)
            {
                NSLog("Unresolved error \(error), \(error!.userInfo)")
                abort()
            }
            return true
        }
        return false
    }
    
    func insertDateFirstLauchApp()
    {
        let querry = PFQuery(className: "CategoriesMenu")
        querry.orderByDescending("tag")
        querry.findObjectsInBackgroundWithBlock({(objects:[AnyObject]?, error:NSError?) -> Void in
            if let menuCategories = objects as? [PFObject]
            {
                var error : NSError?
                for category:AnyObject in menuCategories
                {
                    // Get data form server with PFObject
                    let nameCategory: AnyObject? = category.objectForKey("nameCategories")
                    let version: AnyObject = category.objectForKey("versionApp")!
                    let tag = category.objectForKey("tag") as! NSInteger
                    let image = category.objectForKey("imageCategories") as! PFFile
                    /**
                    *  Get image in background
                    */
                    image.getDataInBackgroundWithBlock({
                        (imageData, error ) -> Void in
                        if (error == nil)
                        {
                            // Get image with PFFile
                            let image = UIImage(data:imageData!)
                            // Import data into core data
                            self.addData(nameCategory!, imageCategories: image, version: version, tag: tag)
                        }
                    })
                }
            }
        })
    }
}