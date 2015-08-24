//
//  SOLoginViewController.swift
//  ShopOnline
//
//  Created by Canh on 8/20/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit
import FontAwesome_swift

class SOLoginViewController: UIViewController {

    @IBOutlet weak var mLoginView: UIView!
    
    @IBOutlet weak var mUserNameTextField: UITextField!
    @IBOutlet weak var mUserNameUnderLineView: UIView!
  
    @IBOutlet weak var mPasswordUnderLineView: UIView!
    @IBOutlet weak var mPasswordTextField: UITextField!
    
    @IBOutlet weak var mLoginButton: UIButton!
    @IBOutlet weak var mLoginFaceBookButton: UIButton!
    
    @IBOutlet weak var mCloseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self .dismissKeyboard()
        self.mLoginButton.layer.cornerRadius = 5;
        self.mLoginFaceBookButton.layer.cornerRadius = 5;

        // FontAwesome icon in button
        self.mCloseButton.titleLabel?.font = UIFont.fontAwesomeOfSize(25)
        self.mCloseButton.setTitle(String.fontAwesomeIconWithName(.TimesCircleO), forState: .Normal)
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

}
