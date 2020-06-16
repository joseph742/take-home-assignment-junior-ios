//
//  MockNetworkSession.swift
//  EasyShopperTests
//
//  Created by Joseph Umoru on 16/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation
@testable import EasyShopper

/*
 Description: A mock class that conforms to the NetworkingSession
 property1: data
 property2: response
 property3: error
 method1: loadData
        parameter1: request
        parameter2: completion
*/

class MockNetworkSession: NetworkingSession {
    
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    func loadData(with request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        completion(data, response, error)
    }
}
