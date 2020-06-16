//
//  MockyRestClient.swift
//  EasyShopper
//
//  Created by Joseph Umoru on 13/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation

/*
 Description: Defines the RequestDataType and ResponseDataType associatedtype. And also the makeRequest, parseResponse methods
*/

protocol APIRequest {
    associatedtype RequestDataType
    associatedtype ResponseDataType
    func makeRequest(from stringUrl: RequestDataType) throws -> URLRequest
    func parseResponse(data: Data) throws -> ResponseDataType
}


class MockyRestClient: APIRequest {
    
    /*
     Description: Handles creating the URL instance from the provided string
     parameters1: data
     */
    func makeRequest(from stringUrl: String) throws -> URLRequest {
        guard let mockyUrl = URL(string: stringUrl) else {
            throw NetworkResponseError.url
        }
        
        return URLRequest(url: mockyUrl)
    }
    
    /*
     Description: Hanldes deserialization from the provided Data
     parameters1: data
     */
    
    func parseResponse(data: Data) throws -> Products {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(Products.self, from: data)
    }
}
