//
//  SORegisterViewController.swift
//  ShopOnline
//
//  Created by Canh on 8/29/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit
import SCLAlertView
import Parse

class SORegisterViewController: UIViewController {
    
    @IBOutlet weak var mLoaddingView: UIView!
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
        self.mUserAvatarImageView.layer.cornerRadius = self.mUserAvatarImageView.frame.size.width / 2
        self.mSignUpButton.layer.cornerRadius = 5
        self.mUserAvatarImageView.clipsToBounds = true
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
    
    @IBAction func clickSelectImageGesture(sender: AnyObject)
    {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    @IBAction func clickSignUpButton(sender: AnyObject)
    {
        
        var username = self.mUserNameTextField.text
        var password = self.mPasswordTextField.text
        var email = self.mEmailTextField.text
        var newUser = PFUser()
        newUser.username = username
        newUser.password = password
        newUser.email = email
        if self.checkTextFieldValidate()
        {
            self.mLoaddingView.showLoading()
            newUser.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
                if ((error) != nil)
                {
                    
                    var alert = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    self.mLoaddingView.hideLoading()
                }
                else
                {
                    let imageData = UIImagePNGRepresentation(self.mUserAvatarImageView.image)
                    let imageFile:PFFile = PFFile(data: imageData)
                    PFUser.currentUser()!.setObject(imageFile, forKey: "avartaProfile")
                    PFUser.currentUser()!.saveInBackgroundWithBlock
                        {
                            (success, error) -> Void in
                            if (success)
                            {
                                self.mLoaddingView.hideLoading()
                            }
                            else
                            {
                                SCLAlertView().showError("Lỗi xảy ra!", subTitle: "Khong the upload image.")
                            }
                    }
                    self.mLoaddingView.hideLoading()
                    SCLAlertView().showSuccess("Hoàn tất", subTitle: "Chúc mừng bạn đã đăng ký thành công, hãy bắt đầu trải nghiệm với chúng tôi nào!")
                    self.clickCloseButton()
                }
            })
        }
    }
    
    // MARK: Check validate
    
    func checkTextFieldValidate() -> Bool
    {
       if !self.mPhoneNumberTextField.text.validatePhoneNumber()
       {
            SCLAlertView().showError("Lỗi xảy ra!", subTitle: "Bạn nhập số điện thoại chưa đúng, vui lòng nhập chính xác số điện thoại của mình.")
            return false
        }
        if !self.mEmailTextField.text.isEmail()
        {
           SCLAlertView().showError("Lỗi xảy ra!", subTitle: "Vui lòng nhập chính xác email.")
            return false
        }
        if !(self.mConfirmPasswordTextField.text == self.mPasswordTextField.text)
        {
            SCLAlertView().showError("Lỗi xảy ra!", subTitle: "Vui lòng nhập lại mật khẩu xác nhận. Mật khẩu xác nhận phải trùng với mật khẩu của bạn.")
            return false
        }
        return true
    }
    
    // MARK: Actions
    
//    @IBAction func signUpAction(sender: AnyObject) {
//        
//    }

}
extension SORegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        //Place the image in the imageview
        //imageToUpload.image = image
        let profilePicture : UIImage! = image
        profilePicture.rounded
        profilePicture.circle
        self.mUserAvatarImageView.image = profilePicture
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}
