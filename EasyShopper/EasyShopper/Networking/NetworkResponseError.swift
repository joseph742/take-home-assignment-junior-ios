//
//  NetworkResponseError.swift
//  EasyShopper
//
//  Created by Qasim Ahmed on 13/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation

/*
 Description: Enumerates the states of a network response error
 */

enum NetworkResponseError: Error {
    case network
    case decoding
    case url
    
    var reason: String {
      switch self {
      case .network:
        return "An error occurred while fetching data"
      case .decoding:
        return "An error occurred while decoding data"
      case .url:
        return "An invalid url was supplied"
      }
    }
}
