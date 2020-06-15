//
//  ShoppingBasketTableViewCell.swift
//  EasyShopper
//
//  Created by Joseph Umoru on 13/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import UIKit
import Kingfisher

/*
 Description: A subclass of the UITableViewCell class
 property1: productImageView
 property2: productNameLabel
 property3: productQuantityLabel
 property4: activityIndicator
 method1: prepareForReuse
 method2: awakeFromNib
 method3: setSelected
       parameter1: selected
       parameter2: animated
method3: configure
       parameter: productData
*/

class ShoppingBasketTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productQuantityLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        configure(with: .none)
        productImageView.image = UIImage(named: "avatar")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        activityIndicator.color = KachingTheme.colorChoice
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /*
     Description: sets the value for the view objects in the ShoppingBasketTableViewCell
     */
    func configure(with productData: ShoppingBasket?) {
        if let result = productData {
            productNameLabel.text = result.name
            productQuantityLabel.text = "\(result.quantity)"
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
