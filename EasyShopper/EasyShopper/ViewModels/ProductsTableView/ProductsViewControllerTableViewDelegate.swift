//
//  ProductsViewControllerTableViewDelegate.swift
//  EasyShopper
//
//  Created by Joseph Umoru on 15/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import UIKit

/*
 Description: Conforms to the UITableViewDelegate protocol and a subclass of NSObject
 method1: tableView
        parameter1: tableView
        parameter2: indexPath
 method2: tableView
        parameter1: tableView
        parameter2: indexPath
*/

class ProductsViewControllerTableViewDelegate: NSObject, UITableViewDelegate {
    
    private var viewModel: ProductsViewModel!
    
    init(viewModel: ProductsViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.addProductsToShoppingBasket(with: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        viewModel.removeFromShoppingBasket(with: indexPath.row)
    }
}
