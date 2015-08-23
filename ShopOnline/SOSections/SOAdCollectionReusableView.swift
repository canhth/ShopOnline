//
//  SOAdCollectionReusableView.swift
//  ShopOnline
//
//  Created by Canh on 8/23/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

class SOAdCollectionReusableView: UICollectionReusableView, UIScrollViewDelegate
{
    @IBOutlet weak var mAdScrollView: UIScrollView!
    @IBOutlet weak var mAdPageControll: UIPageControl!
    
    func setupAdResableView()
    {
        
        self.mAdPageControll.numberOfPages = 4
        self.mAdScrollView.delegate = self
        
        //Set up frame of scroll view equals super view
        self.mAdScrollView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 80)
        let scrollViewWidth:CGFloat = self.mAdScrollView.frame.width
        let scrollViewHeight:CGFloat = self.mAdScrollView.frame.height
        
        //Create background image for scroll view
        var imgOne = UIImageView(frame: CGRectMake(0, 0, scrollViewWidth, scrollViewHeight))
        imgOne.image = UIImage(named: "ad_banner1")
        var imgTwo = UIImageView(frame: CGRectMake(scrollViewWidth, 0, scrollViewWidth, scrollViewHeight))
        imgTwo.image = UIImage(named: "ad_banner2")
        var imgThree = UIImageView(frame: CGRectMake(scrollViewWidth * 2, 0, scrollViewWidth, scrollViewHeight))
        imgThree.image = UIImage(named: "ad_banner3")
        var imgFour = UIImageView(frame: CGRectMake(scrollViewWidth * 3, 0, scrollViewWidth, scrollViewHeight))
        imgFour.image = UIImage(named: "ad_banner1")
        
        //Add image into scrollview
        self.mAdScrollView .addSubview(imgOne)
        self.mAdScrollView.addSubview(imgTwo)
        self.mAdScrollView.addSubview(imgThree)
        self.mAdScrollView.addSubview(imgFour)
        
        //Reset content size of scroll view
        self.mAdScrollView.contentSize = CGSizeMake(scrollViewWidth * 4, scrollViewHeight)
        self.mAdPageControll.currentPage = 0
        
        // Schedule a timer to auto slide to next page
        NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "moveToNextPage", userInfo: nil, repeats: true)

    }
    
    /* Move scroll view to next page */
    func moveToNextPage ()
    {
        // Move to next page
        var pageWidth:CGFloat = CGRectGetWidth(self.mAdScrollView.frame)
        let maxWidth:CGFloat = pageWidth * 4
        var contentOffset:CGFloat = self.mAdScrollView.contentOffset.x
        
        var slideToX = contentOffset + pageWidth
        
        if  contentOffset + pageWidth == maxWidth
        {
            slideToX = 0
        }
        self.mAdScrollView.scrollRectToVisible(CGRectMake(slideToX, 0, pageWidth, CGRectGetHeight(self.mAdScrollView.frame)), animated: true)
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
