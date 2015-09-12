//
//  SOProductDetailViewController.swift
//  ShopOnline
//
//  Created by Canh on 9/6/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit
import Parse

class SOProductDetailViewController: UIViewController, UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate {

    static var mProductModel = Product()
    var mCategoriesName = String()
    
    @IBOutlet weak var mMainScrollView: UIScrollView!
    @IBOutlet weak var mDetailView: UIView!
    
    /* Title & description product */
    @IBOutlet weak var mImageProductScrollView: UIScrollView!
    @IBOutlet weak var mPageControll: UIPageControl!
    @IBOutlet weak var mProductNameLabel: UILabel!
    @IBOutlet weak var mPriceProduct: UILabel!
    @IBOutlet weak var mFeeTransportLabel: UILabel!
    @IBOutlet weak var mProductAvailable: UILabel!
    @IBOutlet weak var mLikeImageView: UIImageView!
    @IBOutlet weak var mNumberLikeLabel: UILabel!
    @IBOutlet weak var mRatingView: UIView!
    /* Detail product */
    @IBOutlet weak var mShopProfileImageView: UIImageView!
    @IBOutlet weak var mShopNameLabel: UILabel!
    @IBOutlet weak var mNumberProductLabel: UILabel!
    @IBOutlet weak var mSomeDetailLabel: UILabel!
    @IBOutlet weak var mHeightConstraintTextView: NSLayoutConstraint!
    @IBOutlet weak var mContentDetailProductLabel: UITextView!
    @IBOutlet weak var mCategoriesLabel: UILabel!
    @IBOutlet weak var mTradeMarkLabel: UILabel!
    @IBOutlet weak var mStatusProductLabel: UILabel!
    @IBOutlet weak var mAddressLabel: UILabel!
    
    /* Comment tableview */
    @IBOutlet weak var mListCommentTableView: UITableView!
    
    @IBOutlet weak var mProductConcernCollectionView: UICollectionView!
    @IBOutlet weak var mBottomView: UIView!
    @IBOutlet weak var mContactButton: UIButton!
    @IBOutlet weak var mBuyNowButton: UIButton!
    
    @IBOutlet weak var mConstraintHeightTextDetailProduct: NSLayoutConstraint!
    
    @IBOutlet weak var mConstraintTableViewComment: UITableView!

    //Data
    var mImageOfProduct = [ImageProduct]()
    var mCommentProduct : NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        
        //Set up frame of scroll view equals super view
        let scrollViewWidth:CGFloat = self.mImageProductScrollView.frame.width
        let scrollViewHeight:CGFloat = self.mImageProductScrollView.frame.height
        
        //Reset content size of scroll view
        self.mPageControll.currentPage = 0
        self.getListImage(scrollViewWidth, scrollViewHeight: scrollViewHeight)
        
        self.mListCommentTableView.registerNib(UINib(nibName:"SOProductDetailCommentCell", bundle: nil), forCellReuseIdentifier: "SOProductDetailCommentCell")

        self.getCommentProduct()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // Setup content size of big scrollview
        self.mMainScrollView.contentSize = CGSizeMake(self.getWidthScreen(), self.mBottomView.frame.origin.y + self.mBottomView.frame.size.height)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        self.customNavigationBar("")
    }
    
    /**
    Setup view, data of each label
    */
    func setupView()
    {
        self.customNavigationBar(SOListProductViewController.mCategories.nameCategories!)
        
        self.mListCommentTableView.layer.cornerRadius = 5.0
        
        // Array labels
        var arrayLabels : NSArray = [self.mProductNameLabel,
        self.mPriceProduct,
        self.mFeeTransportLabel,
        self.mProductAvailable,
        self.mNumberLikeLabel,
        self.mNumberProductLabel,
        self.mSomeDetailLabel,
        self.mCategoriesLabel,
        self.mTradeMarkLabel,
        self.mStatusProductLabel,
        self.mAddressLabel]
        
        // Array valuse of label
        var arrayValues  = [SOProductDetailViewController.mProductModel.title,
        "\(SOProductDetailViewController.mProductModel.priceProduct!.convertNumberToMoneyVND() as String)",
        "Phí vận chuyển: \(SOProductDetailViewController.mProductModel.transportFee)",
        "Sẵn có:\(SOProductDetailViewController.mProductModel.numberProduct)",
        "\(SOProductDetailViewController.mProductModel.likeNumber)",
            "number product of shop",
        "some detail label",
        self.mCategoriesName,
        "Add trademark",
        SOProductDetailViewController.mProductModel.status,
        "Address of own shop"]
        
        // Set text label
        arrayLabels.enumerateObjectsUsingBlock( { (objectLabel, idx, stop) -> Void in
            var label : UILabel = objectLabel as! UILabel
            label.text = arrayValues[idx]
        })
        self.mContentDetailProductLabel.text = SOProductDetailViewController.mProductModel.subTitle
    }
    
    //MARK:- Image product
    
    /**
    Get list image from server
    
    :param: scrollViewWidth  scroll imageview
    :param: scrollViewHeight scroll imageview
    */
    func getListImage(scrollViewWidth : CGFloat, scrollViewHeight : CGFloat)
    {
        /// Create querry with where key
        let query = ImageProduct.query()
        query!.whereKey("productID", equalTo: SOProductDetailViewController.mProductModel.objectId!)
        
        query!.findObjectsInBackgroundWithBlock
            {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            if let listImage = objects as? [PFObject]
            {
                // Index of image
                var index = 0 as CGFloat
                self.mPageControll.numberOfPages = listImage.count
                // Setup content size of image scrollview when loaded
                self.mImageProductScrollView.contentSize = CGSizeMake(scrollViewWidth * CGFloat(self.mPageControll.numberOfPages), scrollViewHeight)
                // Get image with data
                for object:AnyObject! in listImage
                {
                    println("get image\(index)")
                    let image = object.objectForKey("imageProduct") as! PFFile
                    /**
                    *  Get image in background
                    */
                    image.getDataInBackgroundWithBlock({
                        (imageData, error ) -> Void in
                        if (error == nil)
                        {
                            // Get image with PFFile
                            let image:UIImage = UIImage(data:imageData!)!
                            
                            // Setup scroll view
                            var imgView = UIImageView(frame: CGRectMake(scrollViewWidth * index, 0, scrollViewWidth, scrollViewHeight))
                            imgView.contentMode = UIViewContentMode.ScaleAspectFit
                            imgView.image = image
                            self.mImageProductScrollView.addSubview(imgView)
                            index += 1
                        }
                    })
                }
            }
        }
    }
    
    //MARK: Comment product
    
    /**
    Get all comment of product
    */
    func getCommentProduct()
    {
        /// Create querry with where key
        let query = Comment.query()
        query!.whereKey("productID", equalTo: SOProductDetailViewController.mProductModel.objectId!)
        
        query!.findObjectsInBackgroundWithBlock
            {
                (objects: [AnyObject]?, error: NSError?) -> Void in
                if let listComment = objects as? [PFObject]
                {
                    for comment in listComment
                    {
                        self.mCommentProduct.addObject(comment)
                    }
                    self.mListCommentTableView.reloadData()
                }
        }
    }
    
    //MARK: - UITableView delegate 
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.mCommentProduct.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SOProductDetailCommentCell", forIndexPath: indexPath) as! SOProductDetailCommentCell
        cell.setupDataOfCell(self.mCommentProduct[indexPath.row] as! Comment)
        
        return cell
    }
    
    
    //MARK: - ScrollView delegate
    
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        if scrollView == self.mImageProductScrollView
        {
            var pageWidth:CGFloat = CGRectGetWidth(scrollView.frame)
            var currentPage:CGFloat = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1
            
            // Change the indicator
            self.mPageControll.currentPage = Int(currentPage)
        }
    }
}
