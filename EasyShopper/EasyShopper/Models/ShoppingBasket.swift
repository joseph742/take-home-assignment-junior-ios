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
 method1: increaseQuantity
    parameter1: value
 method2: decreaseQuantity
    parameter1: value
*/

struct ShoppingBasket {
    var id: String
    var imageUrl: String
    var name: String
    var retailPrice: Int
    var quantity: Int = 1
}

extension ShoppingBasket {
    
    /*
     Description: mutates the value of the property qunatity by increasing the value
     */
    mutating func increaseQuantity(by value: Int) {
        quantity += value
    }
    
    /*
     Description: mutates the value of the property qunatity by decreasing the value
     */
    mutating func decreaseQuantity(by value: Int) {
        if quantity > 1 {
            quantity -= 1
        }
    }
}
