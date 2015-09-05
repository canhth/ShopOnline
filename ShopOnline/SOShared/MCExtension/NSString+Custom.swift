//
//  NSString+Custom.swift
//  ShopOnline
//
//  Created by CanhTran on 8/11/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import Foundation

extension String {
    
    /**
    Get class Name
    */
    static func className(aClass: AnyClass) -> String
    {
        return NSStringFromClass(aClass).componentsSeparatedByString(".").last!
    }
    
    /**
    Check the string is the email
    
    :returns: ?true:flase
    */
    func isEmail() -> Bool {
        let regex = NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .CaseInsensitive, error: nil)
        return regex?.firstMatchInString(self, options: nil, range: NSMakeRange(0, count(self))) != nil
    }
    
    /**
    Check the tring is the phone number
    
    :returns: ?true:false
    */
    func validatePhoneNumber() -> Bool {
        
        var charcter  = NSCharacterSet(charactersInString: "0123456789").invertedSet
        var filtered:NSString!
        var inputString:NSArray = self.componentsSeparatedByCharactersInSet(charcter)
        filtered = inputString.componentsJoinedByString("")
        return  self == filtered
    }
    
    /**
    Function create random string to check user register account
    
    :param: len 4
    
    :returns: code with 4 charactor
    */
    static func randomStringWithLength (len : Int) -> NSString {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        var randomString : NSMutableString = NSMutableString(capacity: len)
        
        for (var i=0; i < len; i++){
            var length = UInt32 (letters.length)
            var rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
        }
        
        return randomString.uppercaseString
    }
    
    /**
    Function convert string to money
    
    :returns: money VND
    */
    func convertNumberToMoneyVND() -> String!
    {
        var numberConvert = self.toInt()
        var formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "es_VN")
        return formatter.stringFromNumber(numberConvert!)
    }
}