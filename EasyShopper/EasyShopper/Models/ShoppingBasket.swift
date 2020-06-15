//
//  ShoppingBasket.swift
//  EasyShopper
//
//  Created by Morten Bek Ditlevsen on 11/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation

/*
 Description: A wrapper for the ShoppingBasket data from the MockyRestClient
 property3: id
 property4: imageUrl
 property5: name
 property6: retailPrice
 property7: quantity
*/

struct ShoppingBasket {
    var id: String
    var imageUrl: String
    var name: String
    var retailPrice: Int
    var quantity: Int = 1
}
