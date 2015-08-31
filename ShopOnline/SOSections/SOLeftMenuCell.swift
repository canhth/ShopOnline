//
//  SOLeftMenuCell.swift
//  ShopOnline
//
//  Created by iOS_Dev16 on 8/31/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

class SOLeftMenuCell: UITableViewCell {

    @IBOutlet weak var mImageView: UIImageView!
    @IBOutlet weak var mTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell (image: NSString, title: NSString)
    {
        self.mImageView.image = UIImage(named: image as String)
        self.mTitle.text = title as String
    }
    
}
