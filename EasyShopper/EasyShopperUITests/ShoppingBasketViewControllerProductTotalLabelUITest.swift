//
//  ShoppingBasketViewControllerProductTotalLabelUITest.swift
//  EasyShopperUITests
//
//  Created by Joseph Umoru on 15/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import XCTest

/*
 Description: A subclass of the XCTestCase class
 property1: app
 method1: setUp
 method2: tearDown
 method3: testProductTotalLabelExistence
*/

class ShoppingBasketViewControllerProductTotalLabelUITest: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    /*
     Description: test for the existence of the Product Total Label
     */
    
    func testProductTotalLabelExistence() {
        let firstCell = app.otherElements["onboardingView"].otherElements["totalContainer"].staticTexts["totalLabel"]
        let existencePredicate = NSPredicate(format: "exists == 1")
        let expectationEval = expectation(for: existencePredicate, evaluatedWith: firstCell, handler: nil)
        let mobWaiter = XCTWaiter.wait(for: [expectationEval], timeout: 10.0)
        XCTAssert(XCTWaiter.Result.completed == mobWaiter, "Test Case Failed.")
    }

}
