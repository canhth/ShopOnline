//
//  SOLoginViewController.swift
//  ShopOnline
//
//  Created by Canh on 8/20/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

class SOLoginViewController: UIViewController {

    @IBOutlet weak var mLoginView: UIView!
    
    @IBOutlet weak var mUserNameTextField: UITextField!
    @IBOutlet weak var mUserNameUnderLineView: UIView!
  
    @IBOutlet weak var mPasswordUnderLineView: UIView!
    @IBOutlet weak var mPasswordTextField: UITextField!
    
    @IBOutlet weak var mLoginButton: UIButton!
    @IBOutlet weak var mLoginFaceBookButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mLoginButton.layer.cornerRadius = 5;
        self.mLoginFaceBookButton.layer.cornerRadius = 5;
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
    

    @IBAction func clickForgotPasswordGesture(sender: AnyObject)
    {
    }

}
