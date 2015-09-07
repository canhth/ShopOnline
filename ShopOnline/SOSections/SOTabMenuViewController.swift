//
//  SOTabMenuViewController.swift
//  ShopOnline
//
//  Created by Canh on 8/23/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

class SOTabMenuViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItem()
        self.customNavigationBar("Shop Online")
        self.navigationController?.navigationBar.hidden = false;
        // Do any additional setup after loading the view..// Sets the default color of the icon of the selected 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(true)
        self.customNavigationBar("")
    }
    
    override func viewWillLayoutSubviews()
    {
        var tabFrame = self.tabBar.frame
        // - 40 is editable , I think the default value is around 50 px, below lowers the tabbar and above increases the tab bar size
        tabFrame.size.height = 40
        tabFrame.origin.y = getHeightScreen() - tabFrame.size.height
        self.tabBar.frame = tabFrame
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
