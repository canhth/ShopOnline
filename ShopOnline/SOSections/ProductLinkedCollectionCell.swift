//
//  ProductLinkedCollectionCell.swift
//  ShopOnline
//
//  Created by Canh on 9/15/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

class ProductLinkedCollectionCell: UICollectionViewCell {

    
    @IBOutlet weak var mProductLinedImageView: UIImageView!
    @IBOutlet weak var mProductPriceLabel: UILabel!
    @IBOutlet weak var mLoadingIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCollectionCell(model:Product)
    {
        // Setup price product
        self.mProductPriceLabel.text = model.priceProduct?.convertNumberToMoneyVND()
        
        // Setup image product linked
        self.mLoadingIndicator.hidden = false
        self.mLoadingIndicator.startAnimating()
        model.imageProduct.getDataInBackgroundWithBlock({
            (imageData, error ) -> Void in
            if (error == nil)
            {
                // Get image with PFFile
                let image = UIImage(data:imageData!)
                self.mProductLinedImageView.image = image
            }
            self.mLoadingIndicator.stopAnimating()
        })
    }
}
