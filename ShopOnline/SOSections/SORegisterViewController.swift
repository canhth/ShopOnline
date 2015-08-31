//
//  SORegisterViewController.swift
//  ShopOnline
//
//  Created by Canh on 8/29/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

class SORegisterViewController: UIViewController {
    
    @IBOutlet weak var mPhoneNumberTextField: UITextField!
    @IBOutlet weak var mEmailTextField: UITextField!
    @IBOutlet weak var mUserNameTextField: UITextField!
    @IBOutlet weak var mConfirmPasswordTextField: UITextField!
    @IBOutlet weak var mPasswordTextField: UITextField!
    
    @IBOutlet weak var mUserAvatarImageView: UIImageView!
    @IBOutlet weak var mDescriptionSelectImage: UILabel!
    @IBOutlet weak var mSignUpButton: UIButton!
    
    var actInd : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0, 150, 150)) as UIActivityIndicatorView
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addGesture()
        self.actInd.center = self.view.center
        self.actInd.hidesWhenStopped = true
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        self.setupView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView()
    {
        view.addSubview(self.actInd)
        self.customNavigationBar("Đăng ký")
        // Do any additional setup after loading the view.
        
        //create a new button
        let button: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        //set image for button
        button.setImage(UIImage(named: "circle-close"), forState: UIControlState.Normal)
        //add function for button
        button.addTarget(self, action: "clickCloseButton", forControlEvents: UIControlEvents.TouchUpInside)
        //set frame
        button.frame = CGRectMake(15, 0, 53, 31)
        
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    func clickCloseButton()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.presentingViewController?.dismissViewControllerAnimated(true, completion:nil)
    }
    
    @IBAction func clickSelectImageGesture(sender: AnyObject) {
    }

    @IBAction func clickSignUpButton(sender: AnyObject) {
    }
    // MARK: Actions
    
//    @IBAction func signUpAction(sender: AnyObject) {
//        
//        var username = self.usernameField.text
//        var password = self.passwordField.text
//        var email = self.emailField.text
//        
//        if (username.utf16Count < 4 || password.utf16Count < 5) {
//            
//            var alert = UIAlertView(title: "Invalid", message: "Username must be greater then 4 and Password must be greater then 5", delegate: self, cancelButtonTitle: "OK")
//            alert.show()
//            
//        }else if (email.utf16Count < 8){
//            
//            var alert = UIAlertView(title: "Invalid", message: "Please enter a valid password.", delegate: self, cancelButtonTitle: "OK")
//            alert.show()
//            
//            
//        }else {
//            
//            self.actInd.startAnimating()
//            
//            var newUser = PFUser()
//            newUser.username = username
//            newUser.password = password
//            newUser.email = email
//            
//            newUser.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
//                
//                self.actInd.stopAnimating()
//                
//                if ((error) != nil) {
//                    
//                    var alert = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
//                    alert.show()
//                    
//                }else {
//                    
//                    var alert = UIAlertView(title: "Success", message: "Signed Up", delegate: self, cancelButtonTitle: "OK")
//                    alert.show()
//                    
//                }
//                
//            })
//            
//        }
//        
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
