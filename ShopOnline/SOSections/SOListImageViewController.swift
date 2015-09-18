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
        for image in self.mListImageData
        {
            var imageView = UIImageView(frame: CGRectMake(CGFloat(index) * scrollViewWidth, 0, scrollViewWidth, scrollViewHeight))
            imageView.contentMode = UIViewContentMode.ScaleAspectFit
            imageView.image = image
            self.mListImageScrollView.addSubview(imageView)
            index += 1
        }
        self.mListImageScrollView.contentSize = CGSizeMake(scrollViewWidth * CGFloat(self.mListImageData.count), scrollViewHeight)
    }

    @IBAction func clickCloseButton(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
