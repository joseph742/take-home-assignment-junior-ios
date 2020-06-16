//
//  APIRequestLoader.swift
//  EasyShopper
//
//  Created by Joseph Umoru on 13/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation

/*
 Description: Defines the loadApiRequest methods
 method1: onFetchCompleted
        parameter1: request
        parameter2: completion
*/

protocol NetworkingSession {
    func loadData(with request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

/*
 Description: Generic class that handles http request to the Mocky API
 property1: apiRequest
 property2: urlSession
 method1: init
       parameters1: shouldReturnError
 method2: loadApiRequest
*/

class APIRequestLoader<T: APIRequest> {
    let apiRequest: T
    let urlSession: NetworkingSession
    
    init(apiRequest: T, urlSession: NetworkingSession = URLSession.shared) {
        self.apiRequest = apiRequest
        self.urlSession = urlSession
    }
    
    /*
     Description: Hanldes request to the Product endpoint of the mocky API
     parameter1: requestData
     parameter2: completion
     */
    
    func loadApiRequest(requestData: T.RequestDataType, completion: @escaping (Result<T.ResponseDataType, NetworkResponseError>) -> ()) {
        
        do {
            let urlRequest = try apiRequest.makeRequest(from: requestData)
            
            urlSession.loadData(with: urlRequest) { (data, response, error) in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.hasSuccessStatusCode, let data = data else {
                    completion(Result.failure(NetworkResponseError.network))
                    return
                }
                
                do {
                    let productsData = try self.apiRequest.parseResponse(data: data)
                    completion(Result.success(productsData))
                } catch {
                    completion(Result.failure(NetworkResponseError.decoding))
                }
            }
        } catch  {
            completion(Result.failure(NetworkResponseError.url))
        }
    }
}
