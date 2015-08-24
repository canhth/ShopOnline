//
//  SOLoginViewController.swift
//  ShopOnline
//
//  Created by Canh on 8/20/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit
import FontAwesome_swift
import FBSDKCoreKit
import FBSDKShareKit
import FBSDKLoginKit

class SOLoginViewController: UIViewController , FBSDKLoginButtonDelegate{

    @IBOutlet weak var mLoginView: UIView!
    
    @IBOutlet weak var mUserNameTextField: UITextField!
    @IBOutlet weak var mUserNameUnderLineView: UIView!
  
    @IBOutlet weak var mPasswordUnderLineView: UIView!
    @IBOutlet weak var mPasswordTextField: UITextField!
    
    @IBOutlet weak var mLoginButton: UIButton!
    @IBOutlet weak var mLoginFaceBookButton: FBSDKLoginButton!
    
    @IBOutlet weak var mCloseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self .dismissKeyboard()
        self.mLoginButton.layer.cornerRadius = 5;
        mLoginFaceBookButton.layer.cornerRadius = 5;
        mLoginFaceBookButton.delegate = self
        // FontAwesome icon in button
        self.mCloseButton.titleLabel?.font = UIFont.fontAwesomeOfSize(25)
        self.mCloseButton.setTitle(String.fontAwesomeIconWithName(.TimesCircleO), forState: .Normal)
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            performSegueWithIdentifier("unwindToViewOtherController", sender: self)
        }
        else
        {
            mLoginFaceBookButton.readPermissions = ["public_profile", "email", "user_friends"]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Gesture & keyboard
    
    func addGesture()
    {
        //Looks for single or multiple taps.
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard()
    {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func clickCloseButton(sender: AnyObject)
    {
        //Dismiss view controller after this viewcontroller is presentViewController
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func clickForgotPasswordGesture(sender: AnyObject)
    {

    }
    
    /*--- FaceBook Delegate method --*/
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        println("User Logged In")
        
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        println("User Logged Out")
    }
    //Here is an extra method to grab the Users Facebook data. You can call this method anytime after a user has logged in by calling self.returnUserData().
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                println("Error: \(error)")
            }
            else
            {
                println("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
                println("User Name is: \(userName)")
                let userEmail : NSString = result.valueForKey("email") as! NSString
                println("User Email is: \(userEmail)")
            }
        })
    }
}
