//
//  MockShoppingBasketViewModel.swift
//  EasyShopperTests
//
//  Created by Joseph Umoru on 16/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation
@testable import EasyShopper

/*
 Description: A mock class that conforms to the ShoppingBasketViewModelProtocol
 property1: delegate
 method1: init
        parameter1: delegate
 method2: appendContents
        parameter1: products
*/

class MockShoppingBasketViewModel: ShoppingBasketViewModelProtocol {
    var delegate: ShoppingBasketViewModelDelegate?
    
    init(delegate: ShoppingBasketViewModelDelegate) {
        self.delegate = delegate
    }
    
    func appendContents(of products: [Product]) {
        self.delegate?.onFetchCompleted()
    }
    
}
