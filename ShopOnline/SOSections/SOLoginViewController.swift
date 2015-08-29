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

class SOLoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var mLoginView: UIView!
    
    @IBOutlet weak var mUserNameTextField: UITextField!
    @IBOutlet weak var mUserNameUnderLineView: UIView!
    
    @IBOutlet weak var mPasswordUnderLineView: UIView!
    @IBOutlet weak var mPasswordTextField: UITextField!
    
    @IBOutlet weak var mRegisterButton: UIButton!
    @IBOutlet weak var mLoginButton: UIButton!
    
    @IBOutlet weak var mCloseButton: UIButton!
    
    let facebookReadPermissions = ["public_profile", "email", "user_friends","user_about_me"]
    
    var mActivityIndicator : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0, 150, 150)) as UIActivityIndicatorView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.addGesture()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.hidden = true
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        self.navigationController?.navigationBar.hidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
    Setup view
    */
    func setupView()
    {
        self.mActivityIndicator.center = self.view.center
        self.mActivityIndicator.hidesWhenStopped = true
        self.mActivityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(self.mActivityIndicator)
        self.mLoginButton.layer.cornerRadius = 5;
        self.mRegisterButton .setupBorder(1.0, color: UIColor.whiteColor(), radius: 5.0)
        // FontAwesome icon in button
        
        self.mCloseButton.titleLabel?.font = UIFont.fontAwesomeOfSize(25)
    }
    
    //MARK: - TextField delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == self.mPasswordTextField
        {
            self.clickLoginButton(self.mLoginButton)
        }
        return true
    }
    /**
    Dissmiss keyboard when click Hoan thanh
    */
    func doneButtonAction()
    {
        self.view.endEditing(true)
    }
    
    //MARK: - Actions button
    
    /**
    Close Login view when click X button
    
    :param: sender
    */
    @IBAction func clickCloseButton(sender: AnyObject)
    {
        //Dismiss view controller after this viewcontroller is presentViewController
        self.dismissViewControllerAnimated(true, completion: nil)
    }
  
    /**
    Action click Register --> load Register view
    
    :param: sender
    */
    @IBAction func clickRegisterButton(sender: AnyObject)
    {
        self.navigationController?.pushViewController(setupPushView(SORegisterViewController), animated: true)
    }
    
    
    @IBAction func clickLoginButton(sender: AnyObject)
    {
        var username = self.mUserNameTextField.text
        var password = self.mPasswordTextField.text
        
        if (username.length < 4 || password.length < 5)
        {
            UIAlertView.showAlertView("ShopOnline", message: "Username must be greater then 4 and Password must be greater then 5")
        }
        else
        {
            self.mActivityIndicator.startAnimating()
            
            PFUser.logInWithUsernameInBackground(username, password: password, block: { (user, error) -> Void in
                
                self.mActivityIndicator.stopAnimating()
                
                if ((user) != nil)
                {
                    //Save info of user.
                    UIAlertView.showAlertView("Login Success", message: "Wellcome")
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
                else
                {
                    UIAlertView.showAlertView("Error", message: "\(error)")
                }
            })
        }
    }
    
    /**
    Action load view Forgot passwords
    
    :param: sender
    */
    @IBAction func clickForgotPasswordGesture(sender: AnyObject)
    {
        
    }
    
    /**
    Action login with Face Book
    
    :param: sender
    */
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
                        self.dismissViewControllerAnimated(true, completion: nil)
                    }
                    else
                    {
                        println("facebook me request - error is nil :) ")
                        self .getUserInfo()
                        self.dismissViewControllerAnimated(true, completion: nil)
                    }
                })
            }
                
            else
            {
                NSLog("User logged in through Facebook! \(user!.username)")
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        })
    }
    
    /**
    Func get infor of user
    */
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







