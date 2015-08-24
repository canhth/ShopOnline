//
//  Cache+AppSetting.swift
//  ShopOnline
//
//  Created by iOS_Dev16 on 8/24/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import Foundation

public extension Cache
{
    /* Set CID */
    class func setCid(sCid : String)
    {
        setObjectValue(sCid, key: "Cid")
    }
    class func getCid() -> String
    {
       return objectForKey("Cid") as! String
    }
    
    /* Set member id */
    class func setMemberId(sMemberID : String)
    {
        setObjectValue(sMemberID, key: "MemberID")
    }
    class func getMemberId() -> String
    {
        return objectForKey("MemberID") as! String
    }
    
    /* Set user name */
    class func setUserName(sUserName: String)
    {
        setObjectValue(sUserName, key: "UserName")
    }
    class func getUserName() -> String
    {
        return objectForKey("UserName") as! String
    }
    
    /* Set First time lauch app */
    class func setFirstTimeLauchApp(value:Bool)
    {
        setBoolValue(value, key: "FirstTimeLauchApp")
    }
    class func getFirstTimeLauchApp() -> Bool
    {
        return boolValueForKey("FirstTimeLauchApp") as Bool
    }
    
    /* Set  */
    /* Set  */
    
    /* Set  */
    /* Set  */
    
    /* Set  */
    
}
