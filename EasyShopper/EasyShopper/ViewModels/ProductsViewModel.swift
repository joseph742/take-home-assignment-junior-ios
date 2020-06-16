//
//  ProductsViewModel.swift
//  EasyShopper
//
//  Created by Joseph Umoru on 15/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation
/*
 Description: Defines the onReloadTableViewData, onFetchCompleted, onFetchFailed methods
 method1: onFetchCompleted
 method2: onFetchFailed
        parameter1: reason
 */
protocol ProductsViewModelDelegate: class {
    func onFetchCompleted()
    func onFetchFailed(with reason: String)
}

/*
 Description: Transform model information into values that can be displayed on the view.
 property1: delegate
 property2: productsArray
 property3: isFetchInProgress
 property4: selectedProductsArray
 method1: init
       parameter1: delegate
 method2: product
       parameter1: index
 method3: fetchProducts
 method4: addToShoppingBasket
        parameter1: item
 method5: removeFromShoppingBasket
        parameter1: item
 method6: selectedProducts
*/

class ProductsViewModel: ProductsViewModelProtocol {
    private weak var delegate: ProductsViewModelDelegate?
    private var productsArray: [Product] = []
    private var isFetchInProgress = false
    private var selectedProductsArray: [Product] = []
    
    init(delegate: ProductsViewModelDelegate) {
        self.delegate = delegate
    }
    
    /*
     Description: returns the number of items in the Product array
    */
    func countValue() -> Int {
        return productsArray.count
    }
    
    /*
     Description: returns the character at the specified index from the parameter
     */
    func product(at index: Int) -> Product {
        productsArray[index]
    }
    
    /*
     Description: checks if there is already a fetch in progress before calling making the htttp request to featch products
     */
    func fetchProducts() {
        
        guard !isFetchInProgress else {
            return
        }
        
        isFetchInProgress = true
        let apiLoader = APIRequestLoader(apiRequest: MockyRestClient())
        apiLoader.loadApiRequest(requestData: "https://run.mocky.io/v3/4e23865c-b464-4259-83a3-061aaee400ba") { (response) in
            switch response {
            case .failure(let error):
                DispatchQueue.main.async {
                    self.isFetchInProgress = false
                    self.delegate?.onFetchFailed(with: error.reason)
                }
                
            case .success(let result):
                DispatchQueue.main.async {
                    self.isFetchInProgress = false
                    self.productsArray.append(contentsOf: result.values.sorted(by: {$0.name < $1.name}))
                    self.delegate?.onFetchCompleted()
                }
            }
        }
    }
    
    /*
     Description: appends the selected product at the specified index from the parameter
     */
    func addProductsToShoppingBasket(with id: Int) {
        selectedProductsArray.append(productsArray[id])
    }
    
    /*
     Description: removes the selected product at the specified index from the parameter
     */
    func removeFromShoppingBasket(with id: Int) {
        if selectedProductsArray.contains(productsArray[id]) {
            selectedProductsArray.remove(at: id)
        }
    }
    
    /*
     Description: returns the Products
    */
    func selectedProducts() -> [Product] {
        return selectedProductsArray
    }
}
