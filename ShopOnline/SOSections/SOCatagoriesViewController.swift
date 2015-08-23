//
//  SOCatagoriesViewController.swift
//  ShopOnline
//
//  Created by Canh on 8/22/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

let reuseIdentifier = "CategoriesCell"
let kSegue_Categories_Push_ListProduct:String = "kSegue_Category_Push_Detail"

class SOCatagoriesViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet weak var mCollectionView: UICollectionView!
    let mSectionInsets = UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
    let mTitles = ["Sand Harbor, Lake Tahoe - California","Beautiful View of Manhattan skyline.","Watcher in the Fog","Great Smoky Mountains National Park, Tennessee","Most beautiful place"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        //#warning Incomplete method implementation -- Return the number of items in the section
        return 9
    }
    
    /* Cell for item at index */
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! SOCatagoriesViewCell
        cell.mTitleLabel.text = self.mTitles[indexPath.row % 5]
        let curr = indexPath.row % 5  + 1
        let imgName = "pin\(curr)"
        cell.mImageView.image = UIImage(named: imgName)
        
        return cell
    }

    /* Set size for collection cell */
    func collectionView(collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            return CGSize(width: getWidthScreen()/2 - 2 , height: getHeightScreen()/4)
    }
    
    /* Set layout for collection cell */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return mSectionInsets
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if (segue.identifier == kSegue_Categories_Push_ListProduct)
        {
            let cell = sender as! SOCatagoriesViewCell
            let indexPath = self.mCollectionView?.indexPathForCell(cell)
            let vc = segue.destinationViewController as! SOListProductViewController
            
            let curr = indexPath!.row % 5  + 1
            let imgName = "pin\(curr)"
            
            println(vc)
            vc.currImage = UIImage(named: imgName)
            vc.textHeading = self.mTitles[indexPath!.row % 5]
        }
    }
}
