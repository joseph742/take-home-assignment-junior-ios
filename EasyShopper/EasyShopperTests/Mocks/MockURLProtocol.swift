//
//  MockURLProtocol.swift
//  EasyShopperTests
//
//  Created by Joseph Umoru on 13/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation
import XCTest
@testable import EasyShopper

/*
Description: A mock class that conforms to the URLProtocol
property1: requestHandler
method1: canInit
      parameter1: request
method2: canonicalRequest
       parameter1: reques
 method3: startLoading
 method4: stopLoading
 method5: returnMockResponse
*/

class MockURLProtocol: URLProtocol {
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse?, Data?, Error?))?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        returnMockResponse()
    }
    
    override func stopLoading() {
        returnMockResponse()
    }
    
    func returnMockResponse() {
        guard let handler = MockURLProtocol.requestHandler else {
            XCTFail("Received unexpected request with no handler set")
            return
        }
        
        do {
            let (response, data, error) = try handler(request)
            if let response = response {client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)}
            if let data = data {client?.urlProtocol(self, didLoad: data); client?.urlProtocolDidFinishLoading(self)}
            if let error = error {client?.urlProtocol(self, didFailWithError: error)}
            
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
}
