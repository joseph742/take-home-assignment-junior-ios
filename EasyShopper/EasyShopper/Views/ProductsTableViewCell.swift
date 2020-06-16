//
//  ProductsTableViewCell.swift
//  EasyShopper
//
//  Created by Joseph Umoru on 15/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import UIKit
import Kingfisher

/*
 Description: A subclass of the UITableViewCell class
 property1: productImageView
 property2: productNameLabel
 property3: productPriceLabel
 property4: activityIndicator
 method1: prepareForReuse
 method2: awakeFromNib
 method3: setSelected
       parameter1: selected
       parameter2: animated
method4: configure
       parameter: productData
*/

class ProductsTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /*
     Description: sets the value for the view objects in the ShoppingBasketTableViewCell
     */
    func configure(with productData: Product?) {
        if let result = productData {
            productNameLabel.text = result.name
            productPriceLabel.text = "\(result.retailPrice) DKK"
            guard let imageUrl = URL(string: result.imageUrl) else {
                return
            }
            
            productImageView.kf.setImage(with: imageUrl)
            activityIndicator.stopAnimating()
        } else {
            activityIndicator.startAnimating()
        }
    }

}
