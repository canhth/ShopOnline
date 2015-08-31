//
//  SORegisterViewController.swift
//  ShopOnline
//
//  Created by Canh on 8/29/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

class SORegisterViewController: UIViewController {
    
    var actInd : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0, 150, 150)) as UIActivityIndicatorView
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addGesture()
        self.actInd.center = self.view.center
        self.actInd.hidesWhenStopped = true
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(self.actInd)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickCloseButton(sender: AnyObject)
    {
         self.dismissViewControllerAnimated(true, completion: nil)
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
