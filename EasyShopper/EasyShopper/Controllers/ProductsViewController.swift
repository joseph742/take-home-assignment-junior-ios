//
//  ProductsViewController.swift
//  EasyShopper
//
//  Created by Joseph Umoru on 15/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import UIKit

/*
 Description: Manages interactions between the view and the underlying data
 property1: CellIdentifiers (private)
 property2: productsTableView
 property3: activityIndicator
 property4: viewModel
 property5: tableViewDataSource
 property6: tableViewDelegate
 method1: doneButton
        parameter1: sender
*/

class ProductsViewController: UIViewController, ShowAlert {
    
    private enum CellIdentifiers {
      static let list = "ProductsTableViewCellId"
    }

    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var viewModel: ProductsViewModel!
    var tableViewDataSource: ProductsViewControllerTableViewDataSource?
    var tableViewDelegate: ProductsViewControllerTableViewDelegate?
    weak var delegate: ShoppingBasketViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.isAccessibilityElement = false
        view.accessibilityIdentifier = "productsTableView"
        activityIndicator.color = KachingTheme.colorChoice
        activityIndicator.startAnimating()
        productsTableView.isHidden = true
        productsTableView.separatorColor = KachingTheme.colorChoice
        viewModel = ProductsViewModel(delegate: self)
        viewModel.fetchProducts()
        tableViewDataSource = ProductsViewControllerTableViewDataSource(viewModel: viewModel, reusableIdentifier: CellIdentifiers.list)
        tableViewDelegate = ProductsViewControllerTableViewDelegate(viewModel: viewModel)
        productsTableView.dataSource = tableViewDataSource
        productsTableView.delegate = tableViewDelegate
    }

    @IBAction func doneButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        self.delegate.updateShopingBasket(with: self.viewModel.selectedProducts())
    }
}

/*
 Description: Implements the ProductsViewModelDelegate protocol requirements
*/
extension ProductsViewController: ProductsViewModelDelegate {
    func onFetchCompleted() {
        activityIndicator.stopAnimating()
        productsTableView.isHidden = false
        productsTableView.reloadData()
    }
    
    func onFetchFailed(with reason: String) {
        activityIndicator.stopAnimating()
        let title = "Warning"
        let action = UIAlertAction(title: "OK", style: .default)
        showAlertView(with: title , message: reason, actions: [action])
    }
}
