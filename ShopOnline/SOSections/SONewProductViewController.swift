//
//  SONewProductViewController.swift
//  ShopOnline
//
//  Created by Canh on 9/3/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

let ProductCell = "ProductCollectionCell"

class SONewProductViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet weak var mListProductCollectionView: UICollectionView!
    
    let mTitles = ["Thời trang Nữ","Phụ kiện & Làm đẹp","Thời trang Nam","Mẹ & Bé","Thiết bị di động", "Nhà cửa & Xe", "Điện tử điện máy", "Thú cưng", "Đồ cũ", "Sản phẩm khác"]
    let mImages = ["fashion_girl", "phukien_lamdep", "fashion_men", "mom_baby", "phone", "home_car", "dientu_dienmay","pet", "old_things", "orther_product"]
    let mSectionInsets = UIEdgeInsets(top: 3.0, left: 3.0, bottom: 3.0, right: 3.0)
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mListProductCollectionView.registerNib(UINib(nibName: "ProductCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: - UICollection View
    
    /* Num of sections collection view */
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    /* Num of each item in section */
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 10
    }
    
    /* Cell for item at index */
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = self.mListProductCollectionView.dequeueReusableCellWithReuseIdentifier(ProductCell, forIndexPath: indexPath) as! ProductCollectionCell
        cell.mNameProduct.text = self.mTitles[indexPath.row]
        cell.mImageProduct.image = UIImage(named: self.mImages[indexPath.row])
        cell.layer.shouldRasterize = true;
        cell.layer.rasterizationScale = UIScreen.mainScreen().scale;
        return cell
    }
    
    /* Set size for collection cell */
    func collectionView(collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let screenWidth = getWidthScreen()
        let twoPiecesWidth = floor(screenWidth / 2.0 - 4.0)
        return CGSizeMake(twoPiecesWidth, 220)
    }
    
    /* Set layout for collection cell */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return mSectionInsets
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
