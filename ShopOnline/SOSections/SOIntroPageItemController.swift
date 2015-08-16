//
//  SOIntroPageItemController.swift
//  ShopOnline
//
//  Created by CanhTran on 8/16/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

class SOIntroPageItemController: UIViewController {

    // MARK: - Variables
    var itemIndex: Int = 0
    var imageName: String = "" {
        
        didSet {
            
            if let imageView = contentImageView {
                imageView.image = UIImage(named: imageName)
            }
            
        }
    }
    
    @IBOutlet var contentImageView: UIImageView?
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        contentImageView!.image = UIImage(named: imageName)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
   

}
