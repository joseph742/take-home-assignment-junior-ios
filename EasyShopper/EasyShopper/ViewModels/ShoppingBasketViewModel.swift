//
//  ShoppingBasketViewModel.swift
//  EasyShopper
//
//  Created by Joseph Umoru on 13/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation

/*
 Description: Defines the onFetchCompleted methods
 method1: onFetchCompleted
*/

protocol ShoppingBasketViewModelDelegate: class {
    func onFetchCompleted()
}

/*
 Description: Transforms model information into values that can be displayed on the view.
 property1: delegate
 property2: productsArray
 property3: shopBasket
 method1: init
       parameter1: delegate
 method2: countValue
 method3: clearShoppingBasket
 method4: product
       parameter1: index
 method5: totalRetailPrice
 method6: calculateOccurances
       parameter1: products
 method7: appendContents
       products:
*/

class ShoppingBasketViewModel: ShoppingBasketViewModelProtocol {
    private weak var delegate: ShoppingBasketViewModelDelegate?
    private var products: [Product] = []
    private var shopBasket: [ShoppingBasket] = []
    
    init(delegate: ShoppingBasketViewModelDelegate) {
        self.delegate = delegate
    }
    
    /*
     Description: returns the number of items in the ShoppingBasket array
    */
    func countValue() -> Int {
        return shopBasket.count
    }
    
    /*
     Description: removes all elements from the shoppingBasket and products array
    */
    func clearShoppingBasket() {
        shopBasket.removeAll()
        products.removeAll()
        self.delegate?.onFetchCompleted()
    }
    
    /*
     Description: returns the character at the specified index from the parameter
     */
    func product(at index: Int) -> ShoppingBasket {
        shopBasket[index]
    }
    
    /*
     Description: returns the total sum of all retailPrice property multiplied by their quantity property
     */
    func totalRetailPrice() -> Int {
        return shopBasket.reduce(0, {$0 + ($1.retailPrice * $1.quantity)})
    }
    
    /*
     Description: checks for the frequency of items in the ShoppingBasket array to update the quantity property
     */
    private func calculateOccurances(selectedProducts: [Product]) -> [ShoppingBasket] {
        products.append(contentsOf: selectedProducts)
        
        var productsByID = [Product: Int]()
        
        for item in products {
            if let count = productsByID[item] {
                productsByID[item] = count + 1
            } else {
                productsByID[item] = 1
            }
        }
        
        return productsByID.map{ ShoppingBasket(id: $0.key.id, imageUrl: $0.key.imageUrl, name: $0.key.name, retailPrice: $0.key.retailPrice, quantity: $0.value) }
    }
    
    /*
     Description: appends products to the ShoppingBasket array
     */
    func appendContents(of products: [Product]) {
        shopBasket = calculateOccurances(selectedProducts: products).sorted(by: {$0.name < $1.name})
        self.delegate?.onFetchCompleted()
    }
}
