//
//  ProductCollectionCell.swift
//  ShopOnline
//
//  Created by iOS_Dev16 on 9/3/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

class ProductCollectionCell: UICollectionViewCell {

    @IBOutlet weak var mImageProduct: UIImageView!
    
    @IBOutlet weak var mNameProduct: UILabel!
    @IBOutlet weak var mPriceProduct: UILabel!
    @IBOutlet weak var mSeenNumberLabel: UILabel!
    @IBOutlet weak var mCommentNumberLabel: UILabel!
    @IBOutlet weak var mTypeProductLabel: UILabel!
    @IBOutlet weak var mNewImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
