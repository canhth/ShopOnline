//
//  SOAdCollectionReusableView.swift
//  ShopOnline
//
//  Created by Canh on 8/23/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit
import Parse
import CoreData

class SOAdCollectionReusableView: UICollectionReusableView, UIScrollViewDelegate
{
    @IBOutlet weak var mAdScrollView: UIScrollView!
    @IBOutlet weak var mAdPageControll: UIPageControl!
    var token: dispatch_once_t = 0
    func setupAdResableView()
    {
        // Create list image
        var listImageBanner:[UIImageView] = []
        self.mAdScrollView.delegate = self
        
        //Set up frame of scroll view equals super view
        self.mAdScrollView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 80)
        let scrollViewWidth:CGFloat = self.mAdScrollView.frame.width
        let scrollViewHeight:CGFloat = self.mAdScrollView.frame.height
        
        //TODO: Singleton in swift
        if SONetworking.sharedInstance.isHaveConnection()
        {
            var index = 0 as CGFloat
            self.loadDataToAdBanner(scrollViewWidth, scrollViewHeight: scrollViewHeight)
        }
        else
        {
            self.fetchDataForAdBanner(scrollViewWidth, scrollViewHeight: scrollViewHeight)
        }
        
        //Reset content size of scroll view
        self.mAdScrollView.contentSize = CGSizeMake(scrollViewWidth * CGFloat(self.mAdPageControll.numberOfPages), scrollViewHeight)
        self.mAdPageControll.currentPage = 0
        self.layer.shouldRasterize = true;
        self.layer.rasterizationScale = UIScreen.mainScreen().scale;
    }
    
    /* Move scroll view to next page */
    func moveToNextPage ()
    {
        // Move to next page
        var pageWidth:CGFloat = CGRectGetWidth(self.mAdScrollView.frame)
        let maxWidth:CGFloat = pageWidth * CGFloat(self.mAdPageControll.numberOfPages)
        var contentOffset:CGFloat = self.mAdScrollView.contentOffset.x
        
        var slideToX = contentOffset + pageWidth
        
        if  contentOffset + pageWidth == maxWidth
        {
            slideToX = 0
        }
        self.mAdScrollView.scrollRectToVisible(CGRectMake(slideToX, 0, pageWidth, CGRectGetHeight(self.mAdScrollView.frame)), animated: true)
    }
    
    //MARK: Load data form server
    func loadDataToAdBanner(scrollViewWidth : CGFloat, scrollViewHeight : CGFloat)
    {
        let querry = PFQuery(className: "AdBanner").whereKey("pageLevel", equalTo: 1)
        querry.findObjectsInBackgroundWithBlock({(objects:[AnyObject]?, error:NSError?) -> Void in
            if let adBanner = objects as? [PFObject]
            {
                self.deleteData(SOUtils.sharedInstance.appDelegateManagedObject())
                var error : NSError?
                var index = 0 as CGFloat
                self.mAdPageControll.numberOfPages = adBanner.count
                for object:AnyObject! in adBanner
                {
                    let nameAd = object.objectForKey("nameAd") as! String
                    // Get data form server with PFObject
                    let imageAd = object.objectForKey("imageBanner") as! PFFile
                    let pageLevel = object.objectForKey("pageLevel") as! NSInteger
                    /**
                    *  Get image in background
                    */
                    imageAd.getDataInBackgroundWithBlock({
                        (imageData, error ) -> Void in
                        if (error == nil)
                        {
                            if index < CGFloat(adBanner.count)
                            {
                                // Get image with PFFile
                                let image:UIImage = UIImage(data:imageData!)!
                                
                                // Setup scroll view ad banner
                                var imgView = UIImageView(frame: CGRectMake(scrollViewWidth * index, 0, scrollViewWidth, scrollViewHeight))
                                imgView.image = image
                                self.mAdScrollView.addSubview(imgView)
                                index += 1
                                // Import data into core data
                                self.addData(nameAd, imageBanner: image, pageLevel: pageLevel, managedObjectContext: SOUtils.sharedInstance.appDelegateManagedObject())
                            }
                        }
                    })
                }
                dispatch_once(&self.token)
                {
                    NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "moveToNextPage", userInfo: nil, repeats: true)
                }
            }
        })
    }
    // MARK: - Load Data
    func fetchDataForAdBanner(scrollViewWidth : CGFloat, scrollViewHeight : CGFloat)
    {
        var listBannerCoreData : [AdBanner] = []
        var fetchRequest = NSFetchRequest(entityName: "AdBanner")
        var error: NSError?
        // Fetch list object
        listBannerCoreData = SOUtils.sharedInstance.appDelegateManagedObject().executeFetchRequest(fetchRequest, error: nil) as! [AdBanner]
        if error == nil
        {
            var index = 0 as CGFloat
            for object in listBannerCoreData
            {
                if  Int(index) < listBannerCoreData.count
                {
                    var imgView = UIImageView(frame: CGRectMake(scrollViewWidth * index, 0, scrollViewWidth, scrollViewHeight))
                    imgView.image = UIImage(data: object.imageBanner)
                    self.mAdScrollView.addSubview(imgView)
                }
                index += 1
            }
        }
        else if (listBannerCoreData.count < 1)
        {
            UIAlertView .showAlertView("ERROR", message: "Vui lòng bật Wifi hoặc 3G để kết nối internet")
            self.loadDataNotConnectInternet(scrollViewWidth, scrollViewHeight: scrollViewHeight)
        }
    }
    /**
    Delete all object of entity with name to insert new object
    
    :param: entityName
    */
    func deleteData(managedObjectContext:NSManagedObjectContext)
    {
        // Create fetch request
        let fetchRequest = NSFetchRequest(entityName: "AdBanner")
        var error: NSError?
        // Get list object of Entity
        let items = managedObjectContext.executeFetchRequest(fetchRequest, error: &error) as! [AdBanner]
        // Check the version is changed ?
    
            // Delete all object of core data
        for item in items
        {
            managedObjectContext.deleteObject(item as NSManagedObject)
        }
            // Save object
        if !managedObjectContext.save(&error)
        {
            NSLog("Unresolved error \(error), \(error!.userInfo)")
                abort()
        }
    }

    /**
    Load data to show Ad banner when not connected internet
    
    :param: scrollViewWidth
    :param: scrollViewHeight
    */
    func loadDataNotConnectInternet(scrollViewWidth : CGFloat, scrollViewHeight : CGFloat)
    {
        self.mAdPageControll.numberOfPages = 4
        //Create background image for scroll view
        var imgOne = UIImageView(frame: CGRectMake(0, 0, scrollViewWidth, scrollViewHeight))
        var imgTwo = UIImageView(frame: CGRectMake(scrollViewWidth, 0, scrollViewWidth, scrollViewHeight))
        var imgThree = UIImageView(frame: CGRectMake(scrollViewWidth * 2, 0, scrollViewWidth, scrollViewHeight))
        var imgFour = UIImageView(frame: CGRectMake(scrollViewWidth * 3, 0, scrollViewWidth, scrollViewHeight))
        
        imgFour.image = UIImage(named: "ad_banner1")
        imgOne.image = UIImage(named: "ad_banner1")
        imgTwo.image = UIImage(named: "ad_banner2")
        imgThree.image = UIImage(named: "ad_banner3")
        imgFour.image = UIImage(named: "ad_banner1")
        
        //Add image into scrollview
        self.mAdScrollView .addSubview(imgOne)
        self.mAdScrollView.addSubview(imgTwo)
        self.mAdScrollView.addSubview(imgThree)
        self.mAdScrollView.addSubview(imgFour)
    }
    
    //MARK: - Core Data
    func addData(nameBanner: AnyObject, imageBanner:UIImage?, pageLevel:NSInteger, managedObjectContext:NSManagedObjectContext)
    {
        // Create object with entity name
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("AdBanner", inManagedObjectContext: managedObjectContext) as! AdBanner
        newItem.nameAd = nameBanner as! String
        newItem.pageLevel = pageLevel
        newItem.imageBanner = UIImageJPEGRepresentation( imageBanner, 1);
        var error : NSError? = nil
        // Save object
        if !managedObjectContext.save(&error)
        {
            NSLog("Unresolved error \(error), \(error!.userInfo)")
            abort()
        }
    }
    //MARK: ScrollView Delegate
    
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        var pageWidth:CGFloat = CGRectGetWidth(scrollView.frame)
        var currentPage:CGFloat = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1
        
        // Change the indicator
        self.mAdPageControll.currentPage = Int(currentPage)
    }

}
