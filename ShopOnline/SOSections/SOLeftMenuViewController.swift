//
//  SOLeftMenuViewController.swift
//  ShopOnline
//
//  Created by CanhTran on 8/11/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

class SOLeftMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mNavigationBannerView: UIView!
    @IBOutlet weak var mLeftMenuTableView: UITableView!

    var mArrayLeftMenu:NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mArrayLeftMenu = [ ["image": "new", "title": "Sản phẩm mới nhất"],
                                ["image": "pin_map", "title": "Gần bạn nhất"],
                                ["image" : "discount-coupon", "title" : "Khuyến mãi lớn"]]
        // Do any additional setup after loading the view.
        self.mLeftMenuTableView.registerNib(UINib(nibName: "SOLeftMenuCell", bundle: nil), forCellReuseIdentifier: "SOLeftMenuCell")
        UIApplication.sharedApplication().statusBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: Table view delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 3
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell : SOLeftMenuCell = tableView.dequeueReusableCellWithIdentifier("SOLeftMenuCell", forIndexPath: indexPath) as! SOLeftMenuCell
        // Configure the cell...
        let title = self.mArrayLeftMenu[indexPath.row] .objectForKey("title") as! String
        let image = self.mArrayLeftMenu[indexPath.row] .objectForKey("image") as! String
        cell.setupCell(image, title: title)
        return cell
    }


}
