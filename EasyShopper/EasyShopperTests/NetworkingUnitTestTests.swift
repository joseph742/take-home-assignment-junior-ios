//
//  NetworkingUnitTestTests.swift
//  EasyShopperTests
//
//  Created by Joseph Umoru on 13/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import XCTest
@testable import EasyShopper

/*
 Description: A subclass of the XCTestCase class
 property1: loader
 method1: setUp
 method2: tearDown
 method3: testAPIRequestLoaderSuccess
*/

class NetworkingUnitTestTests: XCTestCase {
    var sut: APIRequestLoader<MockyRestClient>!
    var request: MockyRestClient!
    var response: Products!
    var mockSession: MockNetworkSession!
    var httpResponse: HTTPURLResponse!

    override func setUp() {
        request = MockyRestClient()
        response = Products()
        mockSession = MockNetworkSession()
        let mockJsonData = demoData.data(using: .utf8)
        httpResponse = HTTPURLResponse()
        mockSession.data = mockJsonData
        mockSession.response = httpResponse
        sut = APIRequestLoader(apiRequest: request, urlSession: mockSession)
    }

    override func tearDown() {
        sut = nil
        request = nil
        response = nil
        mockSession = nil
    }
    
    /*
     Description: to simulate success of a network request
     */
    func testAPIRequestLoaderSuccess() {
        let expectation = self.expectation(description: "Proper response")
        sut.loadApiRequest(requestData: "https://run.mocky.io/v3/4e23865c-b464-4259-83a3-061aaee400ba") { (res) in
            switch res {
            case .success(let result):
                self.response = result
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail(error.reason)
            }
        }
        
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertNotNil(response.values)
    }

}
