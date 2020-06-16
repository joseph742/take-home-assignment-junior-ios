//
//  MockProductsViewModelDelegate.swift
//  EasyShopperTests
//
//  Created by Joseph Umoru on 15/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation
@testable import EasyShopper

/*
 Description: A mock class that conforms to the ProductsViewModelDelegate
 property1: onFetchCompletedCalled
 method1: onFetchCompleted
 method2: onFetchFailed
        parameter1: reason
*/

class MockProductsViewModelDelegate: ProductsViewModelDelegate {
    var onFetchCompletedCalled = false
    var onFetchFailedCalled = false
    
    func onFetchCompleted() {
        onFetchCompletedCalled = true
    }
    
    func onFetchFailed(with reason: String) {
        onFetchFailedCalled = true
    }
    
}
