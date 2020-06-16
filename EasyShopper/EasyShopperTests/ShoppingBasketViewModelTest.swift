//
//  ShoppingBasketViewModelTest.swift
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
 method3: testAppendContents
*/

class ShoppingBasketViewModelTest: XCTestCase {
    var sut: MockShoppingBasketViewModel!
    var mockData: [Product]!
    var mockDelegate: MockShoppingBasketViewModelDelegate!

    override func setUp() {
        mockDelegate = MockShoppingBasketViewModelDelegate()
        sut = MockShoppingBasketViewModel(delegate: mockDelegate)
        mockData = [Product.stub(), Product.stub()]
    }

    override func tearDown() {
        sut = nil
    }
    
    /*
     Description: to simulate call to appendContents method
     */
    func testAppendContents() {
        sut.appendContents(of: mockData)
        XCTAssertTrue(mockDelegate.onFetchCompletedCalled)
    }

}
