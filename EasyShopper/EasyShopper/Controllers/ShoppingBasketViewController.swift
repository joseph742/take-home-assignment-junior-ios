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
 property2: ShoppingBasketTableView
 property3: activityIndicator
 property4: productTotalLabel
 property5: viewModel
 property6: tableViewDataSource
 method1: clearShoppingBasket
        parameter1: sender
*/

class ShoppingBasketViewController: UIViewController {
    private enum CellIdentifiers {
      static let list = "shoppingBasketTableViewCell"
    }

    @IBOutlet weak var ShoppingBasketTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var productTotalLabel: UILabel!
    
    private var viewModel: ShoppingBasketViewModel!
    var tableViewDataSource: ShoppingBasketViewControllerDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.isAccessibilityElement = false
        view.accessibilityIdentifier = "onboardingView"
        activityIndicator.color = KachingTheme.colorChoice
        ShoppingBasketTableView.isHidden = true
        ShoppingBasketTableView.separatorColor = KachingTheme.colorChoice
        viewModel = ShoppingBasketViewModel(delegate: self)
        tableViewDataSource = ShoppingBasketViewControllerDataSource(viewModel: viewModel, reusableIdentifier: CellIdentifiers.list)
        ShoppingBasketTableView.dataSource = tableViewDataSource
    }

    @IBAction func clearShoppingBasket(_ sender: UIBarButtonItem) {
        viewModel.clearShoppingBasket()
        activityIndicator.stopAnimating()
        ShoppingBasketTableView.reloadData()
        ShoppingBasketTableView.isHidden = true
        productTotalLabel.text = "Total"
        
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
        activityIndicator.stopAnimating()
        ShoppingBasketTableView.isHidden = false
        ShoppingBasketTableView.reloadData()
        productTotalLabel.text = "Total: \(viewModel.totalRetailPrice())"
    }
}

extension ShoppingBasketViewController {
    /*
     Description: appends products to the Shopping Basket
    */
    
    func updateShopingBasket(with products: [Product]) {
        activityIndicator.startAnimating()
        viewModel.appendContents(of: products)
    }
}
