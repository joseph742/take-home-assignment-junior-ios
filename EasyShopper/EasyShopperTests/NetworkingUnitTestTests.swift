//
//  NetworkingUnitTestTests.swift
//  EasyShopperTests
//
//  Created by Qasim Ahmed on 13/06/2020.
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
    var loader: APIRequestLoader<MockyRestClient>!

    override func setUp() {
        let request = MockyRestClient()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        loader = APIRequestLoader(apiRequest: request, urlSession: urlSession)
    }

    override func tearDown() {
        loader = nil
    }

    /*
     Description: to simulate success of a network request
     */
    func testAPIRequestLoaderSuccess() {
        let mockJsonData = demoData.data(using: .utf8)
        MockURLProtocol.requestHandler = { request in
            XCTAssertEqual(request.url?.path, "/v3/4e23865c-b464-4259-83a3-061aaee400ba")
            return (HTTPURLResponse(), mockJsonData, nil)
        }
        
        let expectation = XCTestExpectation(description: "response")
        loader.loadApiRequest(requestData: "https://run.mocky.io/v3/4e23865c-b464-4259-83a3-061aaee400ba") { (res) in
            switch res {
            case .success(let response):
                let singleData = response["35423"]
                XCTAssertTrue(singleData?.id == "35423")
            case .failure(let error):
                XCTFail(error.reason)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }

}
