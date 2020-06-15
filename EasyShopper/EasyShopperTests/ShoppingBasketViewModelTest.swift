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
 method3: testCalculateOccurances
*/
class ShoppingBasketViewModelTest: XCTestCase {
    var sut: ShoppingBasketViewModel!
    var mockData: [Product]!
    var mockDelegate: MockShoppingBasketViewModelDelegate!

    override func setUp() {
        mockDelegate = MockShoppingBasketViewModelDelegate()
        sut = ShoppingBasketViewModel(delegate: mockDelegate)
        mockData = [Product.stub(), Product.stub()]
    }

    override func tearDown() {
        sut = nil
    }

    /*
     Description: to simulate either success or failure of the calculateOccurances method
     */
    func testCalculateOccurances() {
        sut.appendContents(of: mockData)
        XCTAssertEqual(sut.countValue(), 1)
        XCTAssertTrue(mockDelegate.onFetchCompletedCalled)
    }
    
    /*
     Description: to simulate either success or failure of the totalRetailPrice method
     */
    func testTotalRetailPrice() {
        sut.appendContents(of: mockData)
        XCTAssertEqual(sut.totalRetailPrice(), 800)
    }
    
    /*
     Description: to simulate either success or failure of the clearShoppingBasket method
     */
    func testClearShoppingBasket() {
        sut.appendContents(of: mockData)
        sut.clearShoppingBasket()
        XCTAssertEqual(sut.countValue(), 0)
        XCTAssertTrue(mockDelegate.onFetchCompletedCalled)
    }
    
    /*
     Description: to simulate either success or failure of the product method
     */
    func testProduct() {
        sut.appendContents(of: mockData)
        let firstProduct = sut.product(at: 0)
        XCTAssertEqual(firstProduct.id, Product.stub().id)
    }

}
