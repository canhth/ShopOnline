//
//  SOProductDetailViewController.swift
//  ShopOnline
//
//  Created by Canh on 9/6/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

class SOProductDetailViewController: UIViewController {

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.edgesForExtendedLayout = UIRectEdge.None
//        var frameScrollView = self.mMainScrollView.frame
//        frameScrollView.size.width = self.getWidthScreen()
//        frameScrollView.origin.y = -64
//        self.mMainScrollView.frame = frameScrollView
        self.mImageProductScrollView.contentSize = CGSizeMake(self.getWidthScreen(), self.getHeightScreen()/2.5)
        self.mMainScrollView.contentSize = CGSizeMake(self.getWidthScreen(), self.mBottomView.frame.origin.y + self.mBottomView.frame.size.height)
    }
    
}
