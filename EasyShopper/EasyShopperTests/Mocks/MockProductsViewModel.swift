//
//  MockProductsViewModel.swift
//  EasyShopperTests
//
//  Created by Joseph Umoru on 16/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation
@testable import EasyShopper

/*
 Description: A mock class that conforms to the ProductsViewModelProtocol
 property1: isSuccessFull
 property2: delegate
 method1: init
        parameter1: delegate
 method2: fetchProducts
*/

class MockProductsViewModel: ProductsViewModelProtocol {
    var isSuccessFull = true
    var delegate: ProductsViewModelDelegate?
    
    init(delegate: ProductsViewModelDelegate) {
        self.delegate = delegate
    }
    
    func fetchProducts() {
        if isSuccessFull {
            delegate?.onFetchCompleted()
        } else {
            delegate?.onFetchFailed(with: NetworkResponseError.network.reason)
        }
    }
    
}
