//
//  URLSession+dataTask.swift
//  EasyShopper
//
//  Created by Joseph Umoru on 16/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation

/*
 Description: URLSession conform to the NetworkingSession protocol, hence we call loadData instead of dataTask to fetch data from Mocky API.
 */

extension URLSession: NetworkingSession {
    func loadData(with request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = dataTask(with: request) { (data, response, error) in
            completion(data, response, error)
        }
        
        task.resume()
    }
}
