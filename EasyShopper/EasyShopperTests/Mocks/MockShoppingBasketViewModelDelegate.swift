//
//  MockShoppingBasketViewModelDelegate.swift
//  EasyShopperTests
//
//  Created by Joseph Umoru on 15/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation
@testable import EasyShopper

/*
 Description: A mock class that conforms to the ShoppingBasketViewModelDelegate
 property1: onFetchCompletedCalled
 method1: onFetchCompleted
*/

class MockShoppingBasketViewModelDelegate: ShoppingBasketViewModelDelegate {
    var onFetchCompletedCalled = false
    
    func onFetchCompleted() {
        onFetchCompletedCalled = true
    }
}
