//
//  ALUtilities.swift
//  ALCameraViewController
//
//  Created by Alex Littlejohn on 2015/06/25.
//  Copyright (c) 2015 zero. All rights reserved.
//

import UIKit

internal func SpringAnimation(animations: () -> Void) {
    UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
        
        // Animations
        
        }, completion: { finished in
            
            // remove the views
            if finished {

            }
    })
}

internal func LocalizedString(key: String) -> String {
    return NSLocalizedString(key, tableName: "ALCameraView", bundle: NSBundle(forClass: ALCameraViewController.self), comment: key)
}

extension UIImage {
    func crop(frame: CGRect, scale: CGFloat) -> UIImage {
        
        let drawPoint = CGPointZero
        
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextTranslateCTM(context, -frame.origin.x, -frame.origin.y)
        CGContextScaleCTM(context, scale, scale)
        drawAtPoint(drawPoint)
        
        let croppedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext();
        
        return croppedImage
    }
}