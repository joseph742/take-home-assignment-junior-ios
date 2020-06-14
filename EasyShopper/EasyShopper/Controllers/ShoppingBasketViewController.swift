//
//  ShoppingBasketViewController.swift
//  EasyShopper
//
//  Created by Joseph Umoru on 13/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import UIKit

class ShoppingBasketViewController: UIViewController {
    private enum CellIdentifiers {
      static let list = "shoppingBasketTableViewCell"
    }

    @IBOutlet weak var ShoppingBasketTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var productTotalLabel: UILabel!
    
    private var viewModel: ShoppingBasketViewModel!
    var tableViewDataSource: ShoppingBasketViewControllerDataSource?
    private var shouldShowLoadingCell = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.isAccessibilityElement = false
        view.accessibilityIdentifier = "onboardingView"
        activityIndicator.color = KachingTheme.colorChoice
        activityIndicator.startAnimating()
        ShoppingBasketTableView.isHidden = true
        ShoppingBasketTableView.separatorColor = KachingTheme.colorChoice
        viewModel = ShoppingBasketViewModel(delegate: self)
        tableViewDataSource = ShoppingBasketViewControllerDataSource(viewModel: viewModel, reusableIdentifier: CellIdentifiers.list)
        ShoppingBasketTableView.dataSource = tableViewDataSource
    }

}

extension ShoppingBasketViewController: ShoppingBasketViewModelDelegate {
    func onFetchCompleted() {
        activityIndicator.stopAnimating()
        ShoppingBasketTableView.isHidden = false
        ShoppingBasketTableView.reloadData()
        productTotalLabel.text = "Total: \(viewModel.totalRetailPrice())"
    }
    
    func updateShopingBasket(with products: [Product]) {
        viewModel.appendContents(of: products)
    }
}
