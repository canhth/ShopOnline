//
//  SOSellProductViewController.swift
//  ShopOnline
//
//  Created by Canh on 9/16/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit
import ALCameraViewController

class SOSellProductViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let croppingEnabled = true
        let cameraViewController = ALCameraViewController(croppingEnabled: croppingEnabled) { image in
            // Do something with your image here.
            // If cropping is enabled this image will be the cropped version
        }
        
        presentViewController(cameraViewController, animated: true, completion: nil)
        // Do any additional setup after loading the view.
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
