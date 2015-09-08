//
//  FloatRatingView+Custom.swift
//  ShopOnline
//
//  Created by Canh on 9/8/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import UIKit

extension FloatRatingView
{
    func setupFloatRatingView(rate:Float)
    {
        // Required float rating view params
        self.emptyImage = UIImage(named: "StarEmpty")
        self.fullImage = UIImage(named: "StarFull")
        // Optional params
        self.contentMode = UIViewContentMode.ScaleAspectFit
        self.maxRating = 5
        self.minRating = 1
        self.rating = rate
        self.editable = true
        self.halfRatings = true
        self.floatRatings = false
    }
}
