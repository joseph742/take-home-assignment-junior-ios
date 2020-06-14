//
//  Product.swift
//  EasyShopper
//
//  Created by Morten Bek Ditlevsen on 11/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation

/*
 Description: A wrapper for the Product data from the MockyRestClient
 property1: barcode
 property2: description
 property3: id
 property4: imageUrl
 property5: name
 property6: retailPrice
 property7: costPrice
*/

struct Product: Decodable {
    var barcode, description, id: String
    var imageUrl: String
    var name: String
    var retailPrice: Int
}

extension Product: Comparable, Hashable {
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.barcode == rhs.barcode
            && lhs.description == rhs.description
            && lhs.id == rhs.id
            && lhs.imageUrl == rhs.imageUrl
            && lhs.name == rhs.name
            && lhs.retailPrice == rhs.retailPrice
    }
    
    static func < (lhs: Product, rhs: Product) -> Bool {
        return lhs.barcode < rhs.barcode
            || (lhs.barcode == rhs.barcode && lhs.description < rhs.description)
            || (lhs.barcode == rhs.barcode && lhs.description < rhs.description && lhs.id < rhs.id)
            || (lhs.barcode == rhs.barcode && lhs.description < rhs.description && lhs.id < rhs.id && lhs.imageUrl < rhs.imageUrl)
            || (lhs.barcode == rhs.barcode && lhs.description < rhs.description && lhs.id < rhs.id && lhs.imageUrl < rhs.imageUrl && lhs.name < rhs.name)
            || (lhs.barcode == rhs.barcode && lhs.description < rhs.description && lhs.id < rhs.id && lhs.imageUrl < rhs.imageUrl && lhs.name < rhs.name && lhs.retailPrice < rhs.retailPrice)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
}

typealias Products = [String: Product]
