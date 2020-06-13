//
//  MockyRestClientTest.swift
//  EasyShopperTests
//
//  Created by Qasim Ahmed on 13/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import XCTest
@testable import EasyShopper

/*
 Description: A subclass of the XCTestCase class
 property1: sut
 property2: url
 method1: setUp
 method2: testMakeRequest
 method3: testParseResponse
*/

class MockyRestClientTest: XCTestCase {
    var sut: MockyRestClient!

    override func setUp() {
        sut = MockyRestClient()
    }

    override func tearDown() {
        sut = nil
    }

    /*
     Description: to simulate either success or failure of the testMakeRequest method
     */
    func testMakeRequest() throws {
        let urlRequest = try sut.makeRequest(from: "https://run.mocky.io/v3/4e23865c-b464-4259-83a3-061aaee400ba")
        XCTAssertTrue(urlRequest.url?.scheme == "https")
        XCTAssertTrue(urlRequest.url?.path == "/v3/4e23865c-b464-4259-83a3-061aaee400ba")
        XCTAssertTrue(urlRequest.url?.host == "run.mocky.io")
    }
    
    /*
     Description: to simulate either success or failure of the testParseResponse method
     */
    func testParseResponse() throws {
        let jsonData = demoData.data(using: .utf8)!
        let response = try sut.parseResponse(data: jsonData)
        let singleData = response["35423"]
        XCTAssertTrue(singleData?.id == "35423")
    }

}
