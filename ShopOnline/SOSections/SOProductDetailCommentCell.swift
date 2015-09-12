//
//  SOProductDetailCommentCell.swift
//  ShopOnline
//
//  Created by Canh on 9/8/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

class SOProductDetailCommentCell: UITableViewCell {
    
    @IBOutlet weak var mUserNameLabel: UILabel!
    @IBOutlet weak var mCreateTimeLabel: UILabel!
    @IBOutlet weak var mContentCommentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupDataOfCell(comment:Comment)
    {
        mUserNameLabel.text = "Find user"
        mCreateTimeLabel.text = comment.createdAt?.description
        mContentCommentLabel.text = comment.contentComment
    }
    
}
