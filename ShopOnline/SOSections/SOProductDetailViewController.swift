//
//  SOProductDetailViewController.swift
//  ShopOnline
//
//  Created by Canh on 9/6/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

class SOProductDetailViewController: UIViewController, UIScrollViewDelegate {

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
    
    let mImageProduct = ["dientu_dienmay","fashion_men","home_car"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.mPageControll.numberOfPages = 3
        //Set up frame of scroll view equals super view
        let scrollViewWidth:CGFloat = self.mImageProductScrollView.frame.width
        let scrollViewHeight:CGFloat = self.mImageProductScrollView.frame.height
        var imgOne = UIImageView(frame: CGRectMake(0, 0, scrollViewWidth, scrollViewHeight))
        imgOne.image = UIImage(named: "dientu_dienmay")
        var imgTwo = UIImageView(frame: CGRectMake(scrollViewWidth, 0, scrollViewWidth, scrollViewHeight))
        imgTwo.image = UIImage(named: "fashion_men")
        var imgThree = UIImageView(frame: CGRectMake(scrollViewWidth * 2, 0, scrollViewWidth, scrollViewHeight))
        imgThree.image = UIImage(named: "home_car")
        //Add image into scrollview
        self.mImageProductScrollView .addSubview(imgOne)
        self.mImageProductScrollView.addSubview(imgTwo)
        self.mImageProductScrollView.addSubview(imgThree)
        //Reset content size of scroll view
        self.mPageControll.currentPage = 0
         self.mImageProductScrollView.contentSize = CGSizeMake(scrollViewWidth * 3, scrollViewHeight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.edgesForExtendedLayout = UIRectEdge.None
        self.mMainScrollView.contentSize = CGSizeMake(self.getWidthScreen(), self.mBottomView.frame.origin.y + self.mBottomView.frame.size.height)
    }
    
    func setupView()
    {
        self.mListCommentTableView.layer.cornerRadius = 5.0
        
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
        
        arrayLabels.enumerateObjectsUsingBlock( { (objectLabel, idx, stop) -> Void in
            var label : UILabel = objectLabel as! UILabel
            label.text = arrayValues[idx]
        })
        self.mContentDetailProductLabel.text = SOProductDetailViewController.mProductModel.subTitle
    }
    
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
