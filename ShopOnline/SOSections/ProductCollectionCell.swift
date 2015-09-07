//
//  ProductCollectionCell.swift
//  ShopOnline
//
//  Created by iOS_Dev16 on 9/3/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

let IconNewProduct = "icon-newproduct"
let IconHotProduct = "icon-hotproduct"
let IconSaleProduct = "icon-discountproduct"

let KeyWordNew = "Moi"
let KeyWordHot = "Hot"
let KeyWordDiscount = "Giam gia"

class ProductCollectionCell: UICollectionViewCell {

    @IBOutlet weak var mImageProduct: UIImageView!
    
    @IBOutlet weak var mNameProduct: UILabel!
    @IBOutlet weak var mPriceProduct: UILabel!
    @IBOutlet weak var mLikeNumberLabel: UILabel!
    @IBOutlet weak var mCommentNumberLabel: UILabel!
    @IBOutlet weak var mTypeProductLabel: UILabel!
    @IBOutlet weak var mNewImageView: UIImageView!
    @IBOutlet weak var mLoadingImage: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 3.0
    }
    
    func fillCellWithData( product:Product )
    {
        self.mLoadingImage.startAnimating()
        self.mNameProduct.text = product.title
        self.mPriceProduct.text = product.priceProduct?.convertNumberToMoneyVND()
        self.mLikeNumberLabel.text = "\(product.likeNumber)"
        /**
        *  Setup image new, hot, discount product
        */
        if product.status == KeyWordNew
        {
            self.mNewImageView.image = UIImage(named: IconNewProduct)
        }
        else if product.status == KeyWordHot
        {
            self.mNewImageView.image = UIImage(named: IconHotProduct)
        }
        else if product.status == KeyWordDiscount
        {
            self.mNewImageView.image = UIImage(named: IconSaleProduct)
        }
        product.imageProduct.getDataInBackgroundWithBlock({
            (imageData, error ) -> Void in
            if (error == nil)
            {
                // Get image with PFFile
                let image = UIImage(data:imageData!)
                self.mImageProduct.image = image
            }
            self.mLoadingImage.stopAnimating()
        })
        
        if product.discountProduct > 0
        {
            self.mTypeProductLabel.text = "Sale \(product.discountProduct)%"
        }
        else
        {
            self.mTypeProductLabel.text = ""
        }
        self.layer.shouldRasterize = true;
        self.layer.rasterizationScale = UIScreen.mainScreen().scale;
    }

}
