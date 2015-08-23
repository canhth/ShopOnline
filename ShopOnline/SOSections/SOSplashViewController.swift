//
//  SOSplashViewController.swift
//  ShopOnline
//
//  Created by CanhTran on 8/11/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit
import JTSplashView

class SOSplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        JTSplashView.splashViewWithBackgroundColor(nil, circleColor: nil, circleSize: nil)
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("hideSplashView"), userInfo: nil, repeats: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

    }
    func hideSplashView()
    {
        JTSplashView.finishWithCompletion { () -> Void in
            UIApplication.sharedApplication().statusBarHidden = false
        }
        self.navigationController?.pushViewController(setupPushView(SOIntroViewController), animated: true)
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
