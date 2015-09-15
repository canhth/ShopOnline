//
//  SOListProductViewController.swift
//  ShopOnline
//
//  Created by Canh on 8/23/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

class SOListProductViewController: UIViewController {
    
    @IBOutlet weak var mSwiftPages: SwiftPages!
    
    static var mCategories = MenuCategoriesParse()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var VCIDs : [String] = ["SONewProductViewController", "SODiscountProductViewController", "SOCloestProductViewController"]
        //var buttonImages : [UIImage] = [UIImage(named:"HomeIcon.png")!, UIImage(named:"CollectionIcon.png")!, UIImage(named:"LocationIcon.png")!]
        var buttonTitles : [String] = ["Hàng mới", "Phổ biến", "Gần tôi"]
        mSwiftPages.setOriginY(0.0)
        //mSwiftPages.enableAeroEffectInTopBar(true)
        mSwiftPages.setTopBarBackground(UIColor(red: 232/255, green: 236/255, blue: 238/255, alpha: 1.0))
        mSwiftPages.setButtonsTextColor(UIColor.blackColor())
        mSwiftPages.setAnimatedBarColor(UIColor(red: 46/255, green: 177.0/255, blue: 135/255, alpha: 1.0))
        mSwiftPages.initializeWithVCIDsArrayAndButtonTitlesArray(VCIDs, buttonTitlesArray: buttonTitles)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "viewDetailProduct", name:"ViewDetailProduct", object: nil)
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(true)
        self.customNavigationBar("")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.customNavigationBar(SOListProductViewController.mCategories.nameCategories!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewDetailProduct()
    {
        let productDetail = setupPushView(SOProductDetailViewController) as! SOProductDetailViewController
        productDetail.mCategoriesName = SOListProductViewController.mCategories.nameCategories!
        self.navigationController?.pushViewController(productDetail, animated: true)
    }

}
