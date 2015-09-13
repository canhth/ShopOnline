//
//  SOProductDetailCommentCell.swift
//  ShopOnline
//
//  Created by Canh on 9/8/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit
import Parse

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
        let querry = PFUser.query()
        querry?.whereKey("objectId", equalTo: comment.userID.objectId!)
        println(comment.userID.objectId!)
        querry?.getFirstObjectInBackgroundWithBlock({ (object, error) -> Void in
            if error == nil
            {
                self.mUserNameLabel.text = object!.objectForKey("username") as? String
            }
            else
            {
                self.mUserNameLabel.text = "anonymous"
            }
        })
        
        mCreateTimeLabel.text = comment.createdAt?.description
        mContentCommentLabel.text = comment.contentComment
    }
    
}
