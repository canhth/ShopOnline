//
//  SOLoginViewController.swift
//  ShopOnline
//
//  Created by Canh on 8/20/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit
import FontAwesome_swift
import ParseFacebookUtils

class SOLoginViewController: UIViewController {
    
    @IBOutlet weak var mLoginView: UIView!
    
    @IBOutlet weak var mUserNameTextField: UITextField!
    @IBOutlet weak var mUserNameUnderLineView: UIView!
    
    @IBOutlet weak var mPasswordUnderLineView: UIView!
    @IBOutlet weak var mPasswordTextField: UITextField!
    
    @IBOutlet weak var mLoginButton: UIButton!
    @IBOutlet weak var mLoginFaceBookButton: UIButton!
    
    @IBOutlet weak var mCloseButton: UIButton!
    
    var dict : NSDictionary!
    
    let facebookReadPermissions = ["public_profile", "email", "user_friends","user_about_me"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dismissKeyboard()
        self.mLoginButton.layer.cornerRadius = 5;
        // FontAwesome icon in button
        self.mCloseButton.titleLabel?.font = UIFont.fontAwesomeOfSize(25)
        self.mCloseButton.setTitle(String.fontAwesomeIconWithName(.TimesCircleO), forState: .Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickCloseButton(sender: AnyObject)
    {
        //Dismiss view controller after this viewcontroller is presentViewController
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func clickForgotPasswordGesture(sender: AnyObject)
    {
        
    }
    @IBAction func clickLoginFaceBookButton(sender: AnyObject)
    {
        PFFacebookUtils.logInWithPermissions(facebookReadPermissions, block: { (user: PFUser?, error: NSError?) -> Void in
            //switched ! to ?
            if user == nil
            {
                NSLog("Uh oh. The user cancelled the Facebook login.")
            }
            else if user!.isNew
            {
                var user = PFUser.currentUser()
                //inserted !
                NSLog("User signed up and logged in through Facebook!")
                
                Cache.setIsLogin(true)
                FBRequestConnection.startForMeWithCompletionHandler({
                    (connection: FBRequestConnection!, result: AnyObject!, error: NSError!) -> Void in
                    //println("done me request")
                    if error != nil
                    {
                        println("facebook me request - error is not nil :(")
                        self.performSegueWithIdentifier("kSegue_Login_Success", sender: self)
                    }
                    else
                    {
                        println("facebook me request - error is nil :) ")
                        self .getUserInfo()
                        self.performSegueWithIdentifier("kSegue_Login_Success", sender: self)
                    }
                })
            }
                
            else
            {
                NSLog("User logged in through Facebook! \(user!.username)")
                self.performSegueWithIdentifier("kSegue_Login_Success", sender: self)
            }
        })
        
    }
    
    func getUserInfo()
    {
        if let session = PFFacebookUtils.session()
        {
            if session.isOpen
            {
                println("session is open")
                FBRequestConnection.startForMeWithCompletionHandler({
                    (connection: FBRequestConnection!, result: AnyObject!, error: NSError!) -> Void in
                    //println("done me request")
                    if error != nil
                    {
                        println("facebook me request - error is not nil :(")
                    }
                    else
                    {
                        println("facebook me request - error is nil :) ")
                        let urlUserImg = "http://graph.facebook.com/\(result.objectId)/picture?type=large"
                        let firstName = result.first_name
                        let lastName = result.last_name } })
            }
        } else
        {
            //let user:PFUser = PFUser.currentUser() //println("ohooo \(user)")     
        }
    }
}







