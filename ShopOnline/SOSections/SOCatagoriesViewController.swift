//
//  SOCatagoriesViewController.swift
//  ShopOnline
//
//  Created by Canh on 8/22/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit
import CoreData

let reuseIdentifier = "CategoriesCell"
let kSegue_Categories_Push_ListProduct:String = "kSegue_Category_Push_Detail"

class SOCatagoriesViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet weak var mCollectionView: UICollectionView!
    let mSectionInsets = UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
    var mListCategoriesCoreData : [MenuCategories] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loadDataForCategories()
        //SOUtils.sharedInstance.setupNavigationBar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Load Data
    func loadDataForCategories()
    {
        var fetchRequest = NSFetchRequest(entityName: "MenuCategories")
        
        // Create querry sort object with tag value
        let sortDescriptor = NSSortDescriptor(key: "tag", ascending: true, selector: "localizedCaseInsensitiveCompare:")
        fetchRequest.sortDescriptors = [sortDescriptor]
        var error: NSError?
        // Fetch list object
        mListCategoriesCoreData = self.appDelegateManagedObject().executeFetchRequest(fetchRequest, error: nil) as! [MenuCategories]
    }
    
    //MARK: - UICollection View
    
    /* Setup Header Collection View */
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
        atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView
    {
        let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "SOAdCollectionReusableView",forIndexPath: indexPath) as! SOAdCollectionReusableView
        headerView.setupAdResableView()
        return headerView
    }
    
    /* Num of sections collection view */
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    /* Num of each item in section */
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.mListCategoriesCoreData.count > 0
        {
            return self.mListCategoriesCoreData.count
        }
        return 1
    }
    
    /* Cell for item at index */
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! SOCatagoriesViewCell
        cell.mTitleLabel.text = self.mListCategoriesCoreData[indexPath.row].nameCategories
        cell.mImageView.image = UIImage(data: self.mListCategoriesCoreData[indexPath.row].imageCategories as NSData)
        return cell
    }

    /* Set size for collection cell */
    func collectionView(collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            return CGSize(width: getWidthScreen()/2 - 2 , height: 170)
    }
    
    /* Set layout for collection cell */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return mSectionInsets
    }
    
    func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        let listProductVC = setupPushView(SOListProductViewController) as! SOListProductViewController
        let menuCategory : MenuCategories = self.mListCategoriesCoreData[indexPath.row]
        let objectMenuParse = MenuCategoriesParse(objectId: menuCategory.objectId, nameCategories: menuCategory.nameCategories, version: menuCategory.version, tag: Int(menuCategory.tag))
        SOListProductViewController.mCategories = objectMenuParse
        self.navigationController?.pushViewController(listProductVC, animated: true)
        return true
    }
    
}
