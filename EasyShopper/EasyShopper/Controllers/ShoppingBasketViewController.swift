//
//  ShoppingBasketViewController.swift
//  EasyShopper
//
//  Created by Joseph Umoru on 13/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import UIKit

/*
 Description: Manages interactions between the view and the underlying data
 property1: CellIdentifiers (private)
 property2: shoppingBasketTable
 property3: spinner
 property4: productTotal
 property5: viewModel
 property6: tableViewDataSource
 method1: clearShoppingBasket
        parameter1: sender
*/

class ShoppingBasketViewController: UIViewController {
    private enum CellIdentifiers {
      static let list = "shoppingBasketTableViewCell"
    }
    
    @IBOutlet weak var shoppingBasketTable: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var productTotal: UILabel!
    
    private var viewModel: ShoppingBasketViewModel!
    var tableViewDataSource: ShoppingBasketViewControllerDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.isAccessibilityElement = false
        view.accessibilityIdentifier = "onboardingView"
        spinner.color = KachingTheme.colorChoice
        shoppingBasketTable.isHidden = true
        shoppingBasketTable.separatorColor = KachingTheme.colorChoice
        viewModel = ShoppingBasketViewModel(delegate: self)
        tableViewDataSource = ShoppingBasketViewControllerDataSource(viewModel: viewModel, reusableIdentifier: CellIdentifiers.list)
        shoppingBasketTable.dataSource = tableViewDataSource
    }

    @IBAction func clearShoppingBasket(_ sender: UIBarButtonItem) {
        viewModel.clearShoppingBasket()
        spinner.stopAnimating()
        shoppingBasketTable.reloadData()
        shoppingBasketTable.isHidden = true
        productTotal.text = "Total"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showProductListSegue", let productsViewController = segue.destination as? ProductsViewController
          else {
            return
        }
        
        productsViewController.delegate = self
    }
}

/*
 Description: Implements the ShoppingBasketViewModelDelegate protocol requirements
*/
extension ShoppingBasketViewController: ShoppingBasketViewModelDelegate {
    func onFetchCompleted() {
        spinner.stopAnimating()
        shoppingBasketTable.isHidden = false
        shoppingBasketTable.reloadData()
        productTotal.text = "Total: \(viewModel.totalRetailPrice())"
    }
}

extension ShoppingBasketViewController {
    /*
     Description: appends products to the Shopping Basket
    */
    
    func updateShopingBasket(with products: [Product]) {
        spinner.startAnimating()
        viewModel.appendContents(of: products)
    }
}
