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
    
    let mMessageRegister = "Vui lòng nhập mã xác nhận trên."
    let mTitleRegisterConfirm = "Nhập mã"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addGesture()
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
        if SONetworking.sharedInstance.isHaveConnection()
        {
            if self.checkTextFieldValidate()
            {
                self.checkIsTheHuman()
            }
        }
        else
        {
            UIAlertView.showAlertView("Không có kết nối mạng!", message: "Vui lòng bật 3G/Wifi của bạn.")
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
    
    func handleError(errorCode : NSError) -> String
    {
        var errorDescription:String = ""
        switch errorCode.code {
        case 100:
            errorDescription = "ConnectionFailed"
            break
        case 101:
            errorDescription = "ObjectNotFound"
            break
        case 202:
            errorDescription = "Tên đăng nhập đã có người sử dụng"
            break
        default:
            break
        }
        
        return errorDescription
    }
    
    func checkIsTheHuman()
    {
        let alert = SCLAlertView()
        let textInput = alert.addTextField(title: mTitleRegisterConfirm)
        let randomString : String = String.randomStringWithLength(4) as String
        alert.addButton("Đăng ký")
            {
                if textInput.text.uppercaseString == randomString
                {
                    self.registerUserAccount()
                    alert.hideView()
                }
                else
                {
                    SCLAlertView().showError("Lỗi!", subTitle: "Mã xác nhận bạn vừa nhập chưa đúng, vui lòng nhập lại.")
                }
            }
        alert.showCloseButton = false
        alert.showEdit(randomString, subTitle:mMessageRegister)
    }
    
    func registerUserAccount()
    {
        var username = self.mUserNameTextField.text
        var password = self.mPasswordTextField.text
        var email = self.mEmailTextField.text
        var newUser = PFUser()
        newUser.username = username
        newUser.password = password
        newUser.email = email
        self.mLoaddingView.showLoading()
        /**
        *  Sign up account in background
        */
        newUser.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
            if ((error) != nil)
            {
                // Show error
                SCLAlertView().showError("Lỗi xảy ra!", subTitle: self.handleError(error!))
                self.mLoaddingView.hideLoading()
            }
            else
            {
                // Save image of user and upload it on server
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
                // Finish
                self.mLoaddingView.hideLoading()
                SCLAlertView().showSuccess("Hoàn tất", subTitle: "Chúc mừng bạn đã đăng ký thành công, hãy bắt đầu trải nghiệm với chúng tôi nào!")
                self.clickCloseButton()
            }
        })
    }

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
