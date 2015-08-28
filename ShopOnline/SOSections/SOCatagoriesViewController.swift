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
    let mTitles = ["Thời trang Nữ","Phụ kiện & Làm đẹp","Thời trang Nam","Mẹ & Bé","Thiết bị di động", "Nhà cửa & Xe", "Điện tử điện máy", "Thú cưng", "Đồ cũ", "Sản phẩm khác"]
    let mImages = ["fashion_girl", "phukien_lamdep", "fashion_men", "mom_baby", "phone", "home_car", "dientu_dienmay","pets", "old_thing", "orther_product"]
    
  
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
        return 10
    }
    
    /* Cell for item at index */
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! SOCatagoriesViewCell
        cell.mTitleLabel.text = self.mTitles[indexPath.row]
        let imgName = self.mImages[indexPath.row]
        cell.mImageView.image = UIImage(named: imgName)
        return cell
    }

    /* Set size for collection cell */
    func collectionView(collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            return CGSize(width: getWidthScreen()/2 - 2 , height: getHeightScreen()/3)
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
            
            let imgName = self.mImages[indexPath!.row]
            
            println(vc)
            vc.currImage = UIImage(named: imgName)
            vc.textHeading = self.mTitles[indexPath!.row % 5]
        }
    }
}
