//
//  SONewProductViewController.swift
//  ShopOnline
//
//  Created by Canh on 9/3/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit
import Parse

let ProductCell = "ProductCollectionCell"

class SONewProductViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet weak var mListProductCollectionView: UICollectionView!
    
    var mListNewProduct :[Product] = []
    
    let mSectionInsets = UIEdgeInsets(top: 3.0, left: 3.0, bottom: 3.0, right: 3.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mListProductCollectionView.registerNib(UINib(nibName: "ProductCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionCell")
        self.getDataNewProduct()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Setup view
    
    func setupView()
    {
        
    }
    
    // MARK: - Load Data from server Parse
    
    func getDataNewProduct()
    {
        self.view.showLoading()
        let querry = Product.query()
        querry?.orderByDescending("createdAt")
        querry!.includeKey("nameCategories")
        querry?.whereKey("nameCategories", equalTo: SOListProductViewController.mCategories)
        querry!.findObjectsInBackgroundWithBlock({(objects , error) -> Void in
            if let listProducts = objects as? [Product]
            {
                for object : Product in listProducts
                {
//                    if let parentPointer:PFObject = object["nameCategories"] as? Product
//                    {
//                        if (parentPointer["objectId"] as! String == SOListProductViewController.mCategories)
//                        {
                            self.mListNewProduct.append(object)
//                        }
//                    }
                }
                self.mListProductCollectionView.reloadData()
            }
            else
            {
                println("Error:\(error?.description)")
            }
            self.view.hideLoading()
        })
        
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
        if self.mListNewProduct.count > 0
        {
            return self.mListNewProduct.count
        }
        return 0
    }
    
    /* Cell for item at index */
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = self.mListProductCollectionView.dequeueReusableCellWithReuseIdentifier(ProductCell, forIndexPath: indexPath) as! ProductCollectionCell
        if self.mListNewProduct.count > 0
        {
            cell.fillCellWithData(self.mListNewProduct[indexPath.row])
        }
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
