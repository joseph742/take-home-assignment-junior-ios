//
//  ShoppingBasketViewControllerDataSource.swift
//  EasyShopper
//
//  Created by Joseph Umoru on 14/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import UIKit

/*
 Description: Conforms to the UITableViewDataSource protocol and a subclass of NSObject
 propery1: viewModel
 property2: reusableIdentifier
 method1: init
        parameter1: viewModel
        parameter2: reusableIdentifier
 method2: tableView
        parameter1: tableView
        parameter2: section
 method3: tableView
        parameter1: tableView
        parameter2: indexPath
*/

class ShoppingBasketViewControllerDataSource: NSObject, UITableViewDataSource {
    
    private var viewModel: ShoppingBasketViewModel!
    private let reusableIdentifier: String!
    
    init(viewModel: ShoppingBasketViewModel, reusableIdentifier: String) {
        self.viewModel = viewModel
        self.reusableIdentifier = reusableIdentifier
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countValue()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier, for: indexPath) as! ShoppingBasketTableViewCell
        cell.configure(with: viewModel.product(at: indexPath.row))
        return cell
    }

}
