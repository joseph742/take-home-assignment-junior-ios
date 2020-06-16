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
 property2: productsTable
 property3: spinner
 property4: viewModel
 property5: tableViewDataSource
 property6: tableViewDelegate
 method1: done
        parameter1: sender
*/

class ProductsViewController: UIViewController, ShowAlert {
    
    private enum CellIdentifiers {
      static let list = "ProductsTableViewCellId"
    }
    
    @IBOutlet weak var productsTable: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    private var viewModel: ProductsViewModel!
    var tableViewDataSource: ProductsViewControllerTableViewDataSource?
    var tableViewDelegate: ProductsViewControllerTableViewDelegate?
    weak var delegate: ShoppingBasketViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.isAccessibilityElement = false
        view.accessibilityIdentifier = "productsTableView"
        spinner.color = KachingTheme.colorChoice
        spinner.startAnimating()
        productsTable.isHidden = true
        productsTable.separatorColor = KachingTheme.colorChoice
        viewModel = ProductsViewModel(delegate: self)
        viewModel.fetchProducts()
        tableViewDataSource = ProductsViewControllerTableViewDataSource(viewModel: viewModel, reusableIdentifier: CellIdentifiers.list)
        tableViewDelegate = ProductsViewControllerTableViewDelegate(viewModel: viewModel)
        productsTable.dataSource = tableViewDataSource
        productsTable.delegate = tableViewDelegate
    }
    
    @IBAction func done(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        self.delegate.updateShopingBasket(with: self.viewModel.selectedProducts())
    }
}

/*
 Description: Implements the ProductsViewModelDelegate protocol requirements
*/
extension ProductsViewController: ProductsViewModelDelegate {
    func onFetchCompleted() {
        spinner.stopAnimating()
        productsTable.isHidden = false
        productsTable.reloadData()
    }
    
    func onFetchFailed(with reason: String) {
        spinner.stopAnimating()
        let title = "Warning"
        let action = UIAlertAction(title: "OK", style: .default)
        showAlertView(with: title , message: reason, actions: [action])
    }
}
