//
//  OnboardingUITests.swift
//  EasyShopperUITests
//
//  Created by Joseph Umoru on 16/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import XCTest

/*
 Description: A subclass of the XCTestCase class
 property1: app
 method1: setUp
 method2: tearDown
 method3: testGoingThroughOnboarding
*/

class OnboardingUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGoingThroughOnboarding() {
        app.launch()
        /*
         Description: check if onBoarding is been displayed
         */
        XCTAssertTrue(app.isDisplayingOnboarding)
        
        /*
         Description: check for the existence of navigation bar items and the total label
         */
        let navClearButton = app.navigationBars["EasyShopper.ShoppingBasketView"].buttons.element(matching: .button, identifier: "clearNavigationButton")
        let navAddButton = app.navigationBars["EasyShopper.ShoppingBasketView"].buttons.element(matching: .button, identifier: "addNavigationButton")
        let totalLabel = app.otherElements["onboardingView"].otherElements["totalContainer"].staticTexts["totalLabel"]
        
        XCTAssertTrue(navClearButton.exists, "Nav clear button does not exist.")
        XCTAssertTrue(navAddButton.exists, "Nav add button does not exist.")
        XCTAssertTrue(totalLabel.exists, "Nav add button does not exist.")
        
        /*
         Descriptio: tap on navigation add button
         */
        navAddButton.tap()
        
        /*
         Description: check the table view cell is loaded
         */
        let productTableViewCell = app.tables["ProductsTableView"].cells.element(matching: .cell, identifier: "ProductsTableViewCell")
        let firstCellexistencePredicate = NSPredicate(format: "exists == 1")
        let firstCellexpectationEval = expectation(for: firstCellexistencePredicate, evaluatedWith: productTableViewCell, handler: nil)
        let firstCellmobWaiter = XCTWaiter.wait(for: [firstCellexpectationEval], timeout: 10.0)
        XCTAssert(XCTWaiter.Result.completed == firstCellmobWaiter, "Test Case Failed.")
        
        /*
         Description: check for the existence of tableView cell view objects
         */
        XCTAssertTrue(productTableViewCell.images["ProductImage"].exists, "ProductImage does not exist.")
        XCTAssertTrue(productTableViewCell.staticTexts["ProcductName"].exists, "ProcductName does not exist.")
        XCTAssertTrue(productTableViewCell.staticTexts["ProcductPrice"].exists, "ProcductPrice does not exist.")
        
        /*
         Description: selecting a cell from the tableView
         */
        productTableViewCell.firstMatch.tap()
        
        /*
         Description: check if onBoarding is not been displayed
         */
        XCTAssertFalse(app.isDisplayingOnboarding)
        

        /*
         Description: check for the existence of the done button
         */
        let doneButton = app.otherElements["productsTableView"].otherElements["DoneButtonContainer"].buttons["DoneButton"]
        XCTAssertTrue(doneButton.exists, "Done button not exist")
        
        /*
         Description: tap on done button to exit the view
         */
        doneButton.tap()
        
        /*
         Description: check for the existence of the table view cell
         */
        let shoppingBasketTableViewCell = app.tables["ShoppingBasketTableView"].cells.element(matching: .cell, identifier: "ShoppingBasketTableViewCell")
        let shoppingBasketCellexistencePredicate = NSPredicate(format: "exists == 1")
        let shoppingBasketCellexpectationEval = expectation(for: shoppingBasketCellexistencePredicate, evaluatedWith: shoppingBasketTableViewCell, handler: nil)
        let shoppingBasketCellmobWaiter = XCTWaiter.wait(for: [shoppingBasketCellexpectationEval], timeout: 3.0)
        XCTAssert(XCTWaiter.Result.completed == shoppingBasketCellmobWaiter, "Test Case Failed.")
        
        /*
         Description: check for the existence of tableView cell view objects
         */
        XCTAssertTrue(shoppingBasketTableViewCell.images["ProductBrandImage"].exists, "ProductBrandImage does not exist.")
        XCTAssertTrue(shoppingBasketTableViewCell.staticTexts["ProductBrandNameLabel"].exists, "ProductBrandNameLabel does not exist.")
        XCTAssertTrue(shoppingBasketTableViewCell.staticTexts["ProductPriceLabel"].exists, "ProductPriceLabel does not exist.")
        XCTAssertTrue(shoppingBasketTableViewCell.staticTexts["ProductQuantityLabel"].exists, "ProductQuantityLabel does not exist.")
        
        /*
         Description: check if onBoarding is been displayed
         */
        XCTAssertTrue(app.isDisplayingOnboarding)
        
        /*
         Description: check for the existence of navigation bar items and the total label
         */
        XCTAssertTrue(navClearButton.exists, "Nav clear button does not exist.")
        XCTAssertTrue(navAddButton.exists, "Nav add button does not exist.")
        XCTAssertTrue(totalLabel.exists, "Nav add button does not exist.")
        
        /*
         Description: tap on clear button
         */
        navClearButton.tap()
        
        /*
         Description: check for the non existence of tableView
         */
        let shoppingBasketCellNonExistencePredicate = NSPredicate(format: "exists == 0")
        let shoppingBasketCellNonExistenceexpectationEval = expectation(for: shoppingBasketCellNonExistencePredicate, evaluatedWith: shoppingBasketTableViewCell, handler: nil)
        let shoppingBasketCelNonExistenceMobWaiter = XCTWaiter.wait(for: [shoppingBasketCellNonExistenceexpectationEval], timeout: 3.0)
        XCTAssert(XCTWaiter.Result.completed == shoppingBasketCelNonExistenceMobWaiter, "Test Case Failed.")
    }

}
