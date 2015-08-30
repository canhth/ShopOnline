//
//  SONetworking.swift
//  ShopOnline
//
//  Created by Canh on 8/29/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

class SONetworking: NSObject {
    
    class var sharedInstance: SONetworking
    {
        struct Static
        {
            static var onceToken: dispatch_once_t = 0
            static var instance: SONetworking? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = SONetworking()
        }
        return Static.instance!
    }
    
    let reachability = Reachability.reachabilityForInternetConnection()
    
    func checkConnection()
    {
        reachability.whenReachable = { reachability in
            if reachability.isReachableViaWiFi()
            {
                println("Reachable via Wifi")
            }
            else
            {
                UIAlertView .showAlertView("ShopOnline", message: "Bạn đang kết nối mạng bằng 3G, sẽ rất tốn pin và dung lượng!")
            }
        }
        reachability.whenUnreachable = { reachability in
           UIAlertView .showAlertView("Không có kết nối Internet", message: "Vui lòng bật Wifi hoặc 3G trên thiết bị của bạn!")
        }
        reachability.startNotifier()
    }
    
    /**
    If user connect to server with 3G, do not download .
    */
    func isHaveConnection() -> Bool
    {
        if reachability.isReachable()
        {
            if  reachability.isReachableViaWiFi()
            {
                return true
            }
            else
            {
                return false
            }
        }
        else
        {
            return false
        }
    }
}
