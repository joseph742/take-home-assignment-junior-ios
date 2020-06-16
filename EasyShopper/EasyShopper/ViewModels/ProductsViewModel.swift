//
//  ProductsViewModel.swift
//  EasyShopper
//
//  Created by Joseph Umoru on 15/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation
/*
 Description: Defines the onFetchCompleted, onFetchFailed methods
 method1: onFetchCompleted
 method2: onFetchFailed
        parameter1: reason
 */
protocol ProductsViewModelDelegate: class {
    func onFetchCompleted()
    func onFetchFailed(with reason: String)
}

/*
 Description: Transforms model information into values that can be displayed on the view.
 property1: delegate
 property2: productsArray
 property3: isFetchInProgress
 property4: selectedProductsArray
 method1: init
       parameter1: delegate
 method2: countValue
 method3: product
       parameter1: index
 method4: fetchProducts
 method5: addToShoppingBasket
        parameter1: item
 method6: removeFromShoppingBasket
        parameter1: item
 method7: selectedProducts
*/

class ProductsViewModel: ProductsViewModelProtocol {
    private weak var delegate: ProductsViewModelDelegate?
    private var products: [Product] = []
    private var isFetchInProgress = false
    private var selectedProductsArray: [Product] = []
    
    init(delegate: ProductsViewModelDelegate) {
        self.delegate = delegate
    }
    
    /*
     Description: returns the number of items in the ProductArray array
    */
    func countValue() -> Int {
        return products.count
    }
    
    /*
     Description: returns the character at the specified index from the parameter
     */
    func product(at index: Int) -> Product {
        products[index]
    }
    
    /*
     Description: checks if there is already a fetch in progress before calling loadApiRequest method
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
                    self.products.append(contentsOf: result.values.sorted(by: {$0.name < $1.name}))
                    self.delegate?.onFetchCompleted()
                }
            }
        }
    }
    
    /*
     Description: appends the selected product at the specified index from the parameter
     */
    func addProductsToShoppingBasket(with id: Int) {
        selectedProductsArray.append(products[id])
    }
    
    /*
     Description: removes the selected product at the specified index from the parameter
     */
    func removeFromShoppingBasket(with id: Int) {
        if selectedProductsArray.contains(products[id]) {
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
