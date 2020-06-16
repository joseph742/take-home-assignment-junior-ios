//
//  ProductsViewModelTest.swift
//  EasyShopperTests
//
//  Created by Joseph Umoru on 15/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import XCTest
@testable import EasyShopper

/*
 Description: A subclass of the XCTestCase class
 property1: loader
 method1: setUp
 method2: tearDown
 method3: testSuccess
 method4: testFailure
*/

class ProductsViewModelTest: XCTestCase {
    var sut: MockProductsViewModel!
    var mockData: [Product]!
    var mockDelegate: MockProductsViewModelDelegate!

    override func setUp() {
        mockDelegate = MockProductsViewModelDelegate()
        sut = MockProductsViewModel(delegate: mockDelegate)
        mockData = [Product.stub(), Product.stub()]
    }

    override func tearDown() {
        sut = nil
    }

    /*
     Description: to simulate success fetchProducts method
     */
    func testSuccess() {
        sut.fetchProducts()
        XCTAssertTrue(mockDelegate.onFetchCompletedCalled)
    }
    
    
    /*
     Description: to simulate failure fetchProducts method
     */
    func testFailure() {
        sut.isSuccessFull = false
        sut.fetchProducts()
        XCTAssertTrue(mockDelegate.onFetchFailedCalled)
    }

}
