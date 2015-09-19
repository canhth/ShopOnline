//
//  SOListImageViewController.swift
//  ShopOnline
//
//  Created by Canh on 9/18/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

class SOListImageViewController: UIViewController, UIScrollViewDelegate {

    var mListImageData:[UIImage] = [UIImage]()
    
    @IBOutlet weak var mListImageScrollView: UIScrollView!
    @IBOutlet weak var mCloseButton: UIButton!
    var mPageControll = UIPageControl()
    var mImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView()
    {
        //Set up frame of scroll view equals super view
        self.mListImageScrollView.frame = CGRectMake(0, 0, getWidthScreen(), getHeightScreen())
        let scrollViewWidth:CGFloat = self.mListImageScrollView.frame.width
        let scrollViewHeight:CGFloat = self.mListImageScrollView.frame.height
        
        var index = 0
        self.mPageControll.numberOfPages = self.mListImageData.count
        for image in self.mListImageData
        {
            var imageView = UIImageView(frame: CGRectMake(CGFloat(index) * scrollViewWidth, 0, scrollViewWidth, scrollViewHeight))
            imageView.contentMode = UIViewContentMode.ScaleAspectFit
            imageView.image = image
            self.mListImageScrollView.addSubview(imageView)
            index += 1
        }
        self.mPageControll.currentPage = 1
        //self.getImageView()
        self.mListImageScrollView.contentSize = CGSizeMake(scrollViewWidth * CGFloat(self.mListImageData.count), scrollViewHeight)
        self.mListImageScrollView.flashScrollIndicators()
        self.mListImageScrollView.showsVerticalScrollIndicator = true
    }

    @IBAction func clickCloseButton(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
//    func getImageView()
//    {
//        
//        var scrollImg: UIScrollView = UIScrollView()
//        scrollImg.delegate = self
//        scrollImg.frame = CGRectMake(CGFloat(self.mPageControll.currentPage) * getWidthScreen(), 0, getWidthScreen(), getHeightScreen())
//        scrollImg.backgroundColor = UIColor(red: 90, green: 90, blue: 90, alpha: 0.90)
//        scrollImg.alwaysBounceVertical = false
//        scrollImg.alwaysBounceHorizontal = false
//        scrollImg.showsVerticalScrollIndicator = true
//        scrollImg.flashScrollIndicators()
//        
//        scrollImg.minimumZoomScale = 1.0
//        scrollImg.maximumZoomScale = 10.0
//        
//        self.mListImageScrollView!.addSubview(scrollImg)
//        self.mImageView = UIImageView(frame: CGRectMake(CGFloat(self.mPageControll.currentPage) * getWidthScreen(), 0, getWidthScreen(), getHeightScreen()))
//        self.mImageView.image = self.mListImageData[self.mPageControll.currentPage]
//        self.mImageView.contentMode = UIViewContentMode.ScaleAspectFit
//
//        scrollImg.addSubview(self.mImageView)
//    }
    
    //MARK: ScrollView Delegate
//    
//    func scrollViewDidScroll(scrollView: UIScrollView)
//    {
//        var pageWidth:CGFloat = CGRectGetWidth(scrollView.frame)
//        var currentPage:CGFloat = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1
//        // Change the indicator
//        self.mPageControll.currentPage = Int(currentPage)
//    }
//    
}
