//
//  SOListProductViewController.swift
//  ShopOnline
//
//  Created by Canh on 8/23/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

class SOListProductViewController: UIViewController {
    
    @IBOutlet weak var mImageView: UIImageView!
    @IBOutlet weak var mSwiftPages: SwiftPages!
    @IBOutlet weak var mLabel: UILabel!
    
    var currImage: UIImage?
    var textHeading: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        var VCIDs : [String] = ["SONewProductViewController", "SODiscountProductViewController", "SOCloestProductViewController"]
        //var buttonImages : [UIImage] = [UIImage(named:"HomeIcon.png")!, UIImage(named:"CollectionIcon.png")!, UIImage(named:"LocationIcon.png")!]
        var buttonTitles : [String] = ["Hàng mới", "Giảm giá", "Gần bạn nhất"]
        mSwiftPages.setOriginY(0.0)
        //mSwiftPages.enableAeroEffectInTopBar(true)
        mSwiftPages.setTopBarBackground(UIColor(red: 232/255, green: 236/255, blue: 238/255, alpha: 1.0))
        mSwiftPages.setButtonsTextColor(UIColor.blackColor())
        mSwiftPages.setAnimatedBarColor(UIColor(red: 46/255, green: 177.0/255, blue: 135/255, alpha: 1.0))

        mSwiftPages.initializeWithVCIDsArrayAndButtonTitlesArray(VCIDs, buttonTitlesArray: buttonTitles)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
