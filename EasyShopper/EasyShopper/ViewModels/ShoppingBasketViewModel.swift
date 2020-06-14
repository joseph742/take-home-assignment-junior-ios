//
//  ShoppingBasketViewModel.swift
//  EasyShopper
//
//  Created by Joseph Umoru on 13/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation

/*
 Description: Defines the onReloadTableViewData, onFetchCompleted, onFetchFailed methods
 method1: onFetchCompleted
*/

protocol ShoppingBasketViewModelDelegate: class {
    func onFetchCompleted()
}

/*
 Description: Transform model information into values that can be displayed on the view.
property1: delegate
property2: productsArray
property3: shopBasket
method1: init
       parameter1: delegate
method2: count
method3: clearShoppingBasket
method4: product
       parameter1: index
method5: totalRetailPrice
method6: calculateOccurances
       parameter1: products
method7: appendContents
       products:
*/

class ShoppingBasketViewModel {
    private weak var delegate: ShoppingBasketViewModelDelegate?
    private var productsArray: [Product] = []
    private var shopBasket: [ShoppingBasket] = []
    
    init(delegate: ShoppingBasketViewModelDelegate) {
        self.delegate = delegate
    }
    
    func count() -> Int {
        return shopBasket.count
    }
    
    func clearShoppingBasket() {
        shopBasket.removeAll()
        productsArray.removeAll()
        self.delegate?.onFetchCompleted()
    }
    
    func product(at index: Int) -> ShoppingBasket {
        shopBasket[index]
    }
    
    func totalRetailPrice() -> Int {
        return shopBasket.reduce(0, {$0 + ($1.retailPrice)})
    }
    
    private func calculateOccurances(products: [Product]) -> [ShoppingBasket] {
        productsArray.append(contentsOf: products)
        
        var productDictionary = [Product: Int]()
        
        for item in productsArray {
            if let count = productDictionary[item] {
                productDictionary[item] = count + 1
            } else {
                productDictionary[item] = 1
            }
        }
        
        return productDictionary.map{ ShoppingBasket(id: $0.key.id, imageUrl: $0.key.imageUrl, name: $0.key.name, retailPrice: $0.key.retailPrice, quantity: $0.value) }
    }
    
    func appendContents(of products: [Product]) {
        shopBasket = calculateOccurances(products: products)
        self.delegate?.onFetchCompleted()
    }
}
