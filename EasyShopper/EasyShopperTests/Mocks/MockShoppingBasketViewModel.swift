//
//  MockShoppingBasketViewModel.swift
//  EasyShopperTests
//
//  Created by Joseph Umoru on 16/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation
@testable import EasyShopper

class MockShoppingBasketViewModel: ShoppingBasketViewModelProtocol {
    var delegate: ShoppingBasketViewModelDelegate?
    
    init(delegate: ShoppingBasketViewModelDelegate) {
        self.delegate = delegate
    }
    
    func appendContents(of products: [Product]) {
        self.delegate?.onFetchCompleted()
    }
    
}
