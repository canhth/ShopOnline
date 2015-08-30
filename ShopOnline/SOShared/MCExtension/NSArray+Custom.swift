//
//  NSArray+Custom.swift
//  ShopOnline
//
//  Created by Canh on 8/30/15.
//  Copyright (c) 2015 CanhTran. All rights reserved.
//

import Foundation
extension Array {
    func find(includedElement: T -> Bool) -> Int? {
        for (idx, element) in enumerate(self) {
            if includedElement(element) {
                return idx
            }
        }
        return nil
    }
}