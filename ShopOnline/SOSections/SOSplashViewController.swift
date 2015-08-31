//
//  SOSplashViewController.swift
//  ShopOnline
//
//  Created by CanhTran on 8/11/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit
import JTSplashView

class SOSplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        JTSplashView.splashViewWithBackgroundColor(nil, circleColor: nil, circleSize: nil)
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("hideSplashView"), userInfo: nil, repeats: false)
        self.navigationController?.navigationBar.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func hideSplashView()
    {
        JTSplashView.finishWithCompletion { () -> Void in
            UIApplication.sharedApplication().statusBarHidden = false
        }
        self.navigationController?.pushViewController(setupPushView(SOIntroViewController), animated: true)
    }
    
//    func addData()
//    {
//        let newItem = NSEntityDescription.insertNewObjectForEntityForName("MenuCategories", inManagedObjectContext: self.managedObjectContext!) as! MenuCategories
//        newItem.nameCategories = "Name of categories1"
//        newItem.tag = 5
//        //newItem.imageCategories = UIImageJPEGRepresentation( image, 1);
//        
//        var error : NSError? = nil
//        
//        if !self.managedObjectContext!.save(&error) {
//            NSLog("Unresolved error \(error), \(error!.userInfo)")
//            abort()
//        }
//    }
//
//    func fetchData()
//    {
//        // Create a new fetch request using the LogItem entity
//        
//        let fetchRequest = NSFetchRequest(entityName: "MenuCategories")
//        // Execute the fetch request, and cast the results to an array of LogItem objects
//        
//        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [MenuCategories] {
//   
//            //            // Create an Alert, and set it's message to whatever the itemText is
//            
//            //            let alert = UIAlertController(title: fetchResults[0].nameCategories,
//            
//            //                message: fetchResults[0].tag.stringValue,
//            
//            //                preferredStyle: UIAlertControllerStyle.Alert)
//            
//            //            
//            
//            //            // Display the alert
//            
//            //            self.presentViewController(alert,
//            
//            //                animated: true,
//            
//            //                completion: nil)
//            
//        }
//    }
}
